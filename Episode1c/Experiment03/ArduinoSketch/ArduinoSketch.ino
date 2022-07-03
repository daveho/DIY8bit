// Episode 1C, Experiment 02 Arduino sketch

// Just send data values from the red trimpot to the FIFO.
// These values will be used to generate blocks of 8 foreground/background
// pixels.

////////////////////////////////////////////////////////////////////////
// Constants
////////////////////////////////////////////////////////////////////////

// A pushbutton generating a manual reset is on pin 19 (a.k.a. A5);
// pin 19 is shorted to ground when the button is pressed
#define RST_BTN 19

// display reset output signal
#define DISP_RST 9

// FIFO active-low write signal
#define DISP_CMD_WR 8

// Data bus is on digital pins 0-7, which is AVR port D
#define DATA_BUS_DDR  DDRD
#define DATA_BUS_PORT PORTD

// we have trimpots on A0-A1 to control the
// red/green/blue color intensities
#define RED_INPUT   A0
#define GREEN_INPUT A1
#define BLUE_INPUT  A2

////////////////////////////////////////////////////////////////////////
// Global data
////////////////////////////////////////////////////////////////////////

// for debouncing the manual reset pushbutton
uint8_t button_state, count, activated;

// 1 if reset button is pressed, 0 if reset button is released
uint8_t reset_pressed;

// Number of 5 ms ticks for which we've generated a reset pulse so far
uint8_t reset_count;

// Current red/green/blue color intensities
uint8_t red, green, blue;

////////////////////////////////////////////////////////////////////////
// Functions
////////////////////////////////////////////////////////////////////////

void setup() {
  //Serial.begin(9600);
  
  pinMode(RST_BTN, INPUT_PULLUP);
  pinMode(DISP_RST, OUTPUT);
  pinMode(DISP_CMD_WR, OUTPUT);

  // don't assert FIFO write signal
  digitalWrite(DISP_CMD_WR, HIGH);

  // configure output to data bus
  DATA_BUS_DDR  = 0xFF;
  DATA_BUS_PORT = 0x00;

  // generate a power-on reset pulse
  digitalWrite(DISP_RST, LOW);
  delay(500);
  digitalWrite(DISP_RST, HIGH);
}

void writeToFIFO(uint8_t data) {
  // write to data bus
  DATA_BUS_PORT = data;

  // just to be paranoid, delay so that the data is stable
  delayMicroseconds(1);

  // we're using a 25ns FIFO, so delaying for 1 us = 1000 ns
  // gives the FIFO *plenty* of time to handle the data

  // assert FIFO -WR signal
  digitalWrite(DISP_CMD_WR, LOW);
  delayMicroseconds(1);

  // de-assert FIFO -WR signal
  digitalWrite(DISP_CMD_WR, HIGH);
  delayMicroseconds(1);

  //Serial.println(data);
}

uint8_t readColor(int pin) {
  uint16_t val = analogRead(pin);
  val >>= 2; // we only want the highest 8 bits
  return uint8_t(val);
}

uint16_t ticks;
uint8_t writing = 0;

void loop() {
  delay(5);

  // handle the manual reset button
  uint8_t button_val = digitalRead(RST_BTN);
  if (button_val != button_state) {
    // button value changed
    button_state = button_val;
    count = 0;
    activated = 0;
  } else if (!activated && count >= 4) {
    // button state has been consistent for long enough to
    // be considered a valid input
    activated = 1;
    reset_pressed = (button_val == 0);
    if (reset_pressed) {
      // begin manual reset pulse
      digitalWrite(DISP_RST, LOW);
      writing = 0;
    }
  } else if (!activated) {
    // button value is same as last time, increase count
    count++;
  }

  // If the reset button is being pressed, continue the manual reset pulse.
  // If reset button has been released, continue to generate a manual reset pulse
  // for 100 5ms ticks (i.e., 0.5 seconds).
  uint8_t in_reset = 1;
  if (reset_pressed) {
    // reset was pressed, so initialize color values back to 0
    red = 0;
    green = 0;
    blue = 0;
    reset_count = 1;
  } else {
    // reset is not currently pressed
    if (reset_count == 0) {
      // not generating a manual reset pulse
      in_reset = 0;
    } else if (reset_count == 101) {
      // reset_count has reached the terminal value,
      // so end the manual reset pulse
      digitalWrite(DISP_RST, HIGH);
      reset_count = 0;
      in_reset = 0;
    } else if (reset_count <= 100) {
      // reset count has not reached the terminal value,
      // so continue the manual reset pulse
      reset_count++;
    }
  }

  const uint8_t CMD_PIXDATA = 129;

  if (!in_reset && ticks == 0) {
    if (!writing) {
      red = readColor(RED_INPUT);
      writeToFIFO(CMD_PIXDATA);
      writing = 1;
    } else {
      //writeToFIFO(red);
      writeToFIFO(0x05);
      writing = 0;
    }
  }

  ticks++;
  if (ticks >= 200) {
    ticks = 0;
  }
}
