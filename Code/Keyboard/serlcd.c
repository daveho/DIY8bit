// Example program to output text to a SparkFun serial LCD
// using an 8051 variant such as the 89c51

#include <mcs51/at89x51.h>
#include <stdint.h>

// See:
//   https://exploreembedded.com/wiki/A4.8051_Communication_Protocols:UART,_RS232
//   https://www.electronicwings.com/8051/8051-uart

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

void delay(uint16_t count) {
    volatile uint16_t i;
    for (i = 0; i < count; i++) {
        // do nothing, hope this doesn't get optimized out
    }
}

__code const char *msg1 = "ALL YOUR BASE";
__code const char *msg2 = "ARE BELONG TO US";

void testOutput(void) {
    // Move cursor to beginning of first line
#if 0
    UART_TxChar(SER_CMD);
    UART_TxChar(128+0);
    UART_TxChar('H');
    UART_TxChar('e');
    UART_TxChar('l');
    UART_TxChar('l');
    UART_TxChar('o');
#endif

    UART_TxChar(SER_CMD);
    UART_TxChar(128+0);
    writeString(msg1);

    UART_TxChar(SER_CMD);
    UART_TxChar(128+64);
    writeString(msg2);
}

int main() {
    UART_Init();

    delay(50000);

    // Clear screen
    UART_TxChar(SER_CMD);
    UART_TxChar(1);

    for (;;) {
        testOutput();
        delay(65535);
        P1 = 0x00;
        delay(65535);
        P1 = 0xFF;
    }
}
