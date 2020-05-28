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

// Define this if row inputs have external pull-up resistors
// and column scans send the active column to GND.  This means
// that column input bits are 0 if a key is pressed, and 1
// if a key is not pressed.
#define PULL_UP

#ifdef PULL_UP
#  define INIT_COL_OUTPUT       0xFF
#  define INIT_COL_SCAN         0xFE
#  define NEXT_COLUMN(colout)   ((colout << 1) | 1)
#  define IS_PRESS(now)         (now == 0)
#else
#  error "Don't use this"
/*
#  define INIT_COL_OUTPUT       0
#  define INIT_COL_SCAN         1
#  define NEXT_COLUMN(colout)   (colout << 1)
#  define IS_PRESS(now)         (now != 0)
*/
#endif

#define DEBUG

#ifdef DEBUG
void UART_Init(void) { 
    SCON = 0x50;  // Asynchronous mode, 8-bit data and 1-stop bit
    TMOD = 0x20;  //Timer1 in Mode2.
    TH1 = 0xFD;   // Correct value for 11.0592 MHz crystal
    TR1 = 1;      //Turn ON the timer for Baud rate generation
}

void UART_TxChar(uint8_t ch) {
    SBUF = ch;      // Load the data to be transmitted
    while(TI==0);   // Wait till the data is trasmitted
    TI = 0;         //Clear the Tx flag for next cycle.
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
    uint8_t prev, curr, j, bit;

    // get previous column input values for this col
    prev = press[col];

    // read current values on the column inputs (P0)
    curr = P0;

    for (j = 0, bit = 1; j < 8; j++, bit <<= 1) {
        // see if the column value changed
        uint8_t then = prev & bit;
        uint8_t now = curr & bit;
        if (now != then) {
            send_scancode(col, j, IS_PRESS(now));
        }
    }

    // record updated column values for this column
    press[col] = curr;
}

void kbd_scan(void) {
    uint8_t i, colout;

    // Set initial column scan value
    colout = INIT_COL_SCAN;

    // for each column...
    for (i = 0; i < 8; i++) {
        // output column scan value
        P1 = colout;
        delay(50);

        // check row inputs for this column
        check_rows(i);

        // current column output turns off, next column output turns on
        colout = NEXT_COLUMN(colout);
    }

    // set column outputs back to high
    P1 = 0xFF;
}

int main() {
    uint8_t i;

    delay(10000);
    UART_Init();

    // Writing all 1s to port 0 allows us to use it for input
    P0 = 0xFF;

    // Set initial column outputs
    P1 = INIT_COL_OUTPUT;

    for (i = 0; i < 8; i++) {
        press[i] = INIT_COL_OUTPUT;
    }

    for (;;) {
        kbd_scan();
        delay(1000);
    }
}
