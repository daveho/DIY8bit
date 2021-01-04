// Legs to help C16 keyboard be usable on a flat surface.
// This is a temporary solution until I'm ready to mount
// the keyboard in a more permanent enclosure.

// all measurements are mm

// measured from front flange to rear flange
kb_d = 125;

// desired height of the back flange
back_h = 30;

flange_d = 17; // really 15, but leave some clearance

// hole center is about 6mm  offset from outer edge of flange
screw_hole_offset = 7;

// dimensions for m3 nut pocket
m3_hex_nut_d = 6.15; // measured the long way
m3_hex_nut_h = 2.15;
m3_hex_nut_hole_tolerance = 0.4;

m3_screw_hole_d = 3.2;

bracket_w = 30;
bracket_base_thickness = m3_hex_nut_h + 0.2 + 2;
bracket_wall_thickness = 2.5;

module bracket_solid() {
    cube([bracket_w, flange_d + 2*bracket_wall_thickness, bracket_base_thickness]);
    
    translate([0, 0, bracket_base_thickness]) {
        cube([bracket_w, bracket_wall_thickness, bracket_wall_thickness]);
    }
    
    translate([0, flange_d+bracket_wall_thickness, bracket_base_thickness]) {
        cube([bracket_w, bracket_wall_thickness, bracket_wall_thickness]);
    }
}

module bracket() {
    difference() {
        bracket_solid();
        
        translate([bracket_w/2, flange_d+bracket_wall_thickness-screw_hole_offset, -0.05]) {
            cylinder(r=m3_hex_nut_d/2+m3_hex_nut_hole_tolerance, h=m3_hex_nut_h+0.4+0.1, $fn=6);
            
            cylinder(r=m3_screw_hole_d/2, h=bracket_base_thickness+0.1, $fn=60);
        }
    }
}

bracket();
