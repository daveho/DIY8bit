// Bracket model for C16 keyboard support

include <common.scad>;

module bracket_solid() {
    cube([bracket_w, bracket_d, bracket_base_thickness]);
    
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
