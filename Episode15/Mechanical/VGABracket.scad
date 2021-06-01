// This is a 3D printed bracket (in two parts) to support the
// VGA breakout in order to avoid bending the header pins.

// all dimensions are mm

// width of an M2 nut
nut_w = 3.89;

// allow some clearance (due to imprecision of printer)
nut_clear = 1;

// width of the pocket where the nut will sit
nut_pocket_w = nut_w + nut_clear;

// height of M2 nut, use this as the pocket depth
nut_h = 1.5;

// clearance hole width for an M2 screw
screw_hole_w = 2.4;

// approximate dimensions of M2 screw head (hex drive)
screw_head_w = 4.5; // diameter with clearance
screw_head_h = 2;

pcb_w = 46;
pcb_h = 1.8; // really 1.6, but allow a bit of play

edge_w = 6;

bracket_w = 46 + edge_w*2;
bracket_d = 8;
bracket_h = 4.5; // this is the amount we want to elevate the breakout PCB

top_plate_h = 2 + nut_h;

module bracket() {
    translate([-bracket_w/2, 0, 0]) {
        cube([bracket_w, bracket_d, bracket_h]);
    }
    translate([-bracket_w/2, 0, bracket_h]) {
        cube([edge_w, bracket_d, pcb_h]);
    }
    translate([bracket_w/2 - edge_w, 0, bracket_h]) {
        cube([edge_w, bracket_d, pcb_h]);
    }
}

module bracket_with_screw_holes() {
    difference() {
        bracket();
        // left M2 screw hole
        translate([-bracket_w/2 + edge_w/2, bracket_d/2, -1]) {
            cylinder(r=screw_hole_w/2, h=bracket_h+pcb_h+2, $fn=60);
        }
        // right M2 screw hole
        translate([bracket_w/2 - edge_w/2, bracket_d/2, -1]) {
            cylinder(r=screw_hole_w/2, h=bracket_h+pcb_h+2, $fn=60);
        }
        // recess for left M2 screw head
        translate([-bracket_w/2 + edge_w/2, bracket_d/2, -1]) {
            cylinder(r=screw_head_w/2, h=screw_head_h+1, $fn=60);
        }
        // recess for right M2 screw head
        translate([bracket_w/2 - edge_w/2, bracket_d/2, -1]) {
            cylinder(r=screw_head_w/2, h=screw_head_h+1, $fn=60);
        }
    }
}

module top_plate() {
    translate([-bracket_w/2, 0, 0]) {
        cube([bracket_w, bracket_d, top_plate_h]);
    }
}

module top_plate_with_screw_holes() {
    difference() {
        top_plate();
        // left M2 screw hole
        translate([-bracket_w/2 + edge_w/2, bracket_d/2, -1]) {
            cylinder(r=screw_hole_w/2, h=bracket_h+pcb_h+2, $fn=60);
        }
        // right M2 screw hole
        translate([bracket_w/2 - edge_w/2, bracket_d/2, -1]) {
            cylinder(r=screw_hole_w/2, h=bracket_h+pcb_h+2, $fn=60);
        }
        // left nut pocket
        translate([-bracket_w/2 + edge_w/2, bracket_d/2, top_plate_h - nut_h]) {
            rotate([0, 0, 30]) {
                cylinder(r=nut_pocket_w/2, h=top_plate_h, $fn=6);
            }
        }
        // right nut pocket
        translate([bracket_w/2 - edge_w/2, bracket_d/2, top_plate_h - nut_h]) {
            rotate([0, 0, 30]) {
                cylinder(r=nut_pocket_w/2, h=top_plate_h, $fn=6);
            }
        }
    }
}

// These are the two parts of the bracket (uncomment one)

//bracket_with_screw_holes();

top_plate_with_screw_holes();
