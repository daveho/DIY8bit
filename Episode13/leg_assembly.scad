// Leg assembly model for C16 keyboard support

include <common.scad>;

module wedge() {
    translate([bracket_wall_thickness, 0, 0]) {
        rotate([0, -90, 0]) {
            linear_extrude(bracket_wall_thickness) {
                polygon(points=[[0,0], [0, leg_d], [leg_back_extra_h, leg_d]]);
            }
        }
    }
}

module leg() {
    cube([bracket_wall_thickness, leg_d, leg_front_height]);
    translate([0, 0, leg_front_height]) {
        wedge();
    }
}

// printing the entire assembly at once doesn't work, so print
// the bracket and leg assembly separately
/*
module assembly() {
    translate([0, 0, leg_front_height]) {
        rotate([kb_incline_angle, 0, 0]) {
            bracket();
        }
    }

    leg();
    
    translate([bracket_w-bracket_wall_thickness, 0, 0]) {
        leg();
    }
    
    cube([bracket_w, leg_d, bracket_wall_thickness]);
}
*/

module leg_assembly() {
    leg();
    
    translate([bracket_w-bracket_wall_thickness, 0, 0]) {
        leg();
    }
    
    cube([bracket_w, leg_d, bracket_wall_thickness]);
}


// uncomment this to print a leg assembly
translate([0, 0, leg_d]) {
    rotate([-90, 0, 0]) {
        leg_assembly();
    }
}
