// Keyboard controller for C16 keyboard
// An 8051-family microcontroller (89C51 or 87C51) scans the
// key matrix and sends scan codes to the host system via
// an IDT7201 FIFO memory.

// Sources:

// C16 keyboard:
//   http://www.zimmers.net/anonftp/pub/cbm/schematics/computers/plus4/C16_Service_Manual_314001-03_(1984_Oct).pdf
// Page 8 shows the keyboard matrix.

// Programming the 8051 UART:
//   https://exploreembedded.com/wiki/A4.8051_Communication_Protocols:UART,_RS232
//   https://www.electronicwings.com/8051/8051-uart

// IDT7201:
//   https://www.idt.com/us/en/document/dst/720072017202-datasheet

#include <mcs51/at89x51.h>
#include <stdint.h>

#define DEBUG

#ifdef DEBUG
void UART_Init(void) { 
    SCON = 0x50;  // Asynchronous mode, 8-bit data and 1-stop bit
    TMOD = 0x20;  // Timer1 in Mode2.
    TH1 = 0xFD;   // Correct value for 11.0592 MHz crystal
    TR1 = 1;      // Turn ON the timer for Baud rate generation
}

void UART_TxChar(uint8_t ch) {
    SBUF = ch;      // Load the data to be transmitted
    while(TI==0);   // Wait till the data is trasmitted
    TI = 0;         // Clear the Tx flag for next cycle.
}

// Command character
#define SER_CMD 254

void writeString(__code const char *s) {
    while (*s) {
        UART_TxChar(*s++);
    }
}
#endif

void delay(uint16_t count) {
    volatile uint16_t i;
    for (i = 0; i < count; i++) {
        // do nothing, hope this doesn't get optimized out
    }
}

#ifdef DEBUG
__code const char *hexdigits = "0123456789abcdef";
__code const char *scanmsg = "scan: ";

void writeHex(uint8_t val) {
   // The row and column numbers are 0-7, so we really
   // only need one digit
   //UART_TxChar(hexdigits[val >> 4]);
   UART_TxChar(hexdigits[val & 0xF]);
}
#endif

uint8_t press[8];

void send_scancode(uint8_t col, uint8_t row, uint8_t press) {
    // Format scancode
    uint8_t scancode = (col << 3) | row;
    if (press) {
        scancode |= (1 << 6);
    }

    // Write scancode to port 2 (which outputs to the FIFO data inputs)
    P2 = scancode;

    // Send a low pulse on P3.6 to write the scancode to the FIFO
    P3_6 = 0;
    P3_6 = 1;

#ifdef DEBUG
    UART_TxChar(SER_CMD);
    UART_TxChar(128+0);
    writeString(scanmsg);
    writeHex(col);
    UART_TxChar(',');
    writeHex(row);
    UART_TxChar(',');
    writeHex(press);
#endif
}

void check_rows(int col) {
    uint8_t prev, curr, row, bit;

    // get previous row input values for this column
    prev = press[col];

    // read current values on the row inputs (P0)
    curr = P0;

    // Check each row
    for (row = 0, bit = 1; row < 8; row++, bit <<= 1) {
        // see if the row value changed since the last scan
        uint8_t then = prev & bit;
        uint8_t now = curr & bit;
        if (now != then) {
            uint8_t is_press = (now == 0);
            send_scancode(col, row, is_press);
        }
    }

    // record updated row values for this column
    press[col] = curr;
}

void kbd_scan(void) {
    uint8_t i, colout;

    // Set initial column scan value
    colout = 0xFE;

    // for each column...
    for (i = 0; i < 8; i++) {
        // output column scan value
        P1 = colout;
        delay(10); // make sure row inputs have time to change

        // check row inputs for this column
        check_rows(i);

        // change P1 outputs to scan the next column
        colout = (colout << 1) | 1;
    }

    // set column outputs back to high
    P1 = 0xFF;
}

int main() {
    uint8_t i;

    delay(10000);
#ifdef DEBUG
    UART_Init();
#endif

    // Writing all 1s to port 0 allows us to use it for input
    P0 = 0xFF;

    // Set initial column outputs
    P1 = 0xFF;

    // Make sure P3.6 (which controls the FIFO -WR input) is high
    P3_6 = 1;

    // Reset the FIFO (P3.7 is connected to the FIFO's -RS input)
    P3_7 = 0;
    delay(10);
    P3_7 = 1;

    // Assume that all keys are released initially
    for (i = 0; i < 8; i++) {
        press[i] = 0xFF;
    }

    for (;;) {
        kbd_scan();
        delay(500);
    }
}
