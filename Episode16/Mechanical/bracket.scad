plate_w = 11.8;
plate_d = 3.6 * 2;
plate_h = 4;

// M3 screw hole (diameter)
screw_hole_w = 3.4;

nut_w = 5.6; // square nuts are 5x5 mm, leave a bit extra for clearance
nut_h = 2;

lip_d = 2;

pcb_thickness = 1.6;

module plate() {
    translate([-plate_w/2, -plate_d/2, 0]) {
        cube([plate_w, plate_d, plate_h]);
    }
}

module plate_with_screw_hole() {
    difference() {
        plate();
        
        translate([0, 0, -1]) {
            cylinder(r=screw_hole_w/2, h=plate_h + 2, $fn=60);
        }
        
        translate([-nut_w/2, -nut_w/2, plate_h - nut_h]) {
            cube([nut_w, nut_w, nut_h+1]);
        }
    }
}

// this is the lip connected to the plate that overhangs the bottom edge
// of the PCB and helps the bracket to stay in place snugly
module lip() {
    translate([-plate_w/2, -lip_d/2, 0]) {
        cube([plate_w, lip_d, plate_h + pcb_thickness]);
    }
}

module bracket() {
    plate_with_screw_hole();
    translate([0, -plate_d/2 - lip_d/2, -pcb_thickness]) {
        lip();
    }
}

bracket();
