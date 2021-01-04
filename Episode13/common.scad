// all measurements are mm

// measured from front flange to rear flange
kb_d = 125;

// desired height of the back flange
back_h = 30;

flange_d = 15.2; // really 15, but leave some clearance

// hole center is about 6mm  offset from outer edge of flange
screw_hole_offset = 7;

// dimensions for m3 nut pocket
m3_hex_nut_d = 6.15; // measured the long way
m3_hex_nut_h = 2.15;
m3_hex_nut_hole_tolerance = 0.4;

// m3 screw hole diameter
m3_screw_hole_d = 3.2;

// bracket dimensions
bracket_w = 30;
bracket_base_thickness = m3_hex_nut_h + 0.2 + 2;
bracket_wall_thickness = 2;
bracket_d = flange_d + 2*bracket_wall_thickness; // depth of bracket base

// angle by which keyboard is inclined
kb_incline_angle = 13.8865;

leg_back_extra_h = ((3*bracket_d) / 12.5);
leg_front_height = 30 - leg_back_extra_h;
leg_d = sqrt(bracket_d*bracket_d - leg_back_extra_h*leg_back_extra_h);
