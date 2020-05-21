#include <mcs51/at89x51.h>
#include <stdint.h>

// Assuming oscillator is 16MHz
#define INTERRUPTS_PER_SECOND 5208

volatile uint8_t led_state = 0;
volatile uint16_t timer_counter = INTERRUPTS_PER_SECOND;

void Timer0_ISR(void) __interrupt (1) {
    timer_counter--;
    if(timer_counter == 0) {
        led_state = !led_state;
        timer_counter = INTERRUPTS_PER_SECOND;
    }
}

int main() {
    TMOD = 0x3;     // Timer mode - 8bits, no prescaler. freq = OSCFREQ/12/2^8
    TL0 = 0;        // Clear counter
    TH0 = 0;        // Clear register
    TR0 = 1;        // Set timer to run.
    ET0 = 1;        // Set interrupt.
    EA = 1;         // Set global interrupt.
    while(1) {
        if (led_state) {
            P1 = 0xFF;
        } else {
            P1 = 0x00;
        }
    }
}
