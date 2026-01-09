// Timing constants

// Number of clock ticks per scanline
localparam TICKS_PER_SCANLINE = 800;

// Number of scanlines per frame
localparam SCANLINES_PER_FRAME = 525;

// Horizontal timing
localparam H_COUNT_END = 799;
localparam H_BEGIN_PULSE = 655;
localparam H_END_PULSE = 12'd751;
localparam H_VIS_END = 639;
localparam H_BEGIN_ACTIVE = 793;
localparam H_END_ACTIVE = 633;

// Vertical timing
localparam V_COUNT_INITIAL_VAL = 485; // before the vsync pulse is started
localparam V_COUNT_END = 524;
localparam V_BEGIN_PULSE = 490;
localparam V_END_PULSE = 492;
localparam V_VIS_END = 480;
localparam V_COUNT_ZERO = 0;
localparam V_END_ACTIVE = 480;

// vim:ft=verilog:
