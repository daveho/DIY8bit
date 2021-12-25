// Experiment 3 Arduino sketch
// The FIFO is connected, and does read data.
// TODO: actually send some data periodically.

// A pushbutton generating a manual reset is on pin 19 (a.k.a. A5)
#define RST_BTN 19

// display reset output signal
#define DISP_RST 9

// FIFO active-low write signal
#define DISP_CMD_WR 8

// Data bus is on digital pins 0-7, which is AVR port D
#define DATA_BUS_DDR  DDRD
#define DATA_BUS_PORT PORTD

void setup() {
  pinMode(RST_BTN, INPUT_PULLUP);
  pinMode(DISP_RST, OUTPUT);
  pinMode(DISP_CMD_WR, OUTPUT);

  // don't assert FIFO write signal
  digitalWrite(DISP_CMD_WR, HIGH);

  // configure output to data bus
  DATA_BUS_DDR  = 0xFF;
  DATA_BUS_PORT = 0x00;

  // generate a reset pulse
  generateResetPulse();
}

void generateResetPulse() {
  digitalWrite(DISP_RST, LOW);
  delay(500);
  digitalWrite(DISP_RST, HIGH);
}

void handleResetButton(uint8_t val) {
  if (val != 0) {
    // if reset button is released, delay for a bit
    delay(200);
  }
  digitalWrite(DISP_RST, val == 0 ? LOW : HIGH);
}

uint8_t button_state, count, activated;

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
    handleResetButton(button_val);
    activated = 1;
  } else if (!activated) {
    // button value is same as last time, increase count
    count++;
  }
}
