// all dimensions are mm

// the back_plate hangs down from the top plate on one side of
// the card cage rail
back_plate_h = 3;
back_plate_d = 15 + back_plate_h;

// width of one unit, reflects spacing of backplane connectors,
// which are 0.75" apart
clip_w = 0.75 * 25.4;

// thickness of PCBs
pcb_thickness = 1.6;

// total clearance between guide clips and PCBs
pcb_clearance = 0.6;

// thickness of blade walls
blade_thickness = 3;
// amount by which blade protrudes from the back_plate
blade_len = 10;

// offset of center of blade from center of clip assembly
blade_offset = (pcb_thickness+pcb_clearance)/2 + blade_thickness/2;

// total back_plate width (excepting rounded ends and screw holes)
back_plate_w = 7*clip_w;

// inset of back_plate screw holes from ends
top_plate_screw_hole_inset = 7;

// screw hole diameter
screw_hole_d = 3.4; // appropriate for M3 screw

// diameter of countersink cutout for screws
screw_countersink_d = 6; // screw heads are about 5mm in diameter


// the top plate is the part which screws to the top of the
// card cage rail
top_plate_w = back_plate_w;
top_plate_h = back_plate_h;
top_plate_d = 15;

// half cylinder for top of clip blade
module blade_tip() {
    difference() {
        rotate([-90, 0, 0]) {
            cylinder(r=blade_thickness/2, h=back_plate_d, $fn=60);
        }
        translate([-blade_thickness, -blade_thickness, -blade_thickness*2]) {
            cube([blade_thickness*2, back_plate_d+blade_thickness*2, blade_thickness*2]);
        }
    }
}

module bevel() {
    rotate([-45, 0, 0]) {
        translate([-blade_thickness, -blade_thickness, 0]) {
            cube([blade_thickness*2, blade_thickness, blade_thickness*2]);
        }
    }
}

module back_bevel() {
    translate([0, back_plate_d, 0]) {
        rotate([0, 0, 180]) {
            bevel();
        }
    }
}

module blade_tip_with_bevel() {
    difference() {
        blade_tip();
        bevel();
        back_bevel();
    }
}

module blade() {
    translate([-blade_thickness/2, 0, 0]) {
        cube([blade_thickness, back_plate_d, blade_len-blade_thickness]);
    }
    translate([0, 0, blade_len-blade_thickness]) {
        blade_tip_with_bevel();
    }
}

module clip_assembly() {
    translate([-clip_w/2, 0, 0]) {
        cube([clip_w, back_plate_d, back_plate_h]);
    }
    translate([-blade_offset, 0, back_plate_h]) {
        blade();
    }
    translate([blade_offset, 0, back_plate_h]) {
        blade();
    }
}

module back_plate() {
    translate([-back_plate_w/2, 0, 0]) {
        cube([back_plate_w, back_plate_d, back_plate_h]);
    }
}

module top_plate() {
    translate([-top_plate_w/2, 0, 0]) {
        cube([top_plate_w, top_plate_d, top_plate_h]);
    }
}

module top_plate_with_screw_holes() {
    difference() {
        top_plate();
        
        translate([-top_plate_w/2 + top_plate_screw_hole_inset, top_plate_d/2, -1]) {
            cylinder(r=screw_hole_d/2, h=top_plate_h+2, $fn=60);
        }
        translate([-top_plate_w/2 + top_plate_screw_hole_inset, top_plate_d/2, top_plate_h-1]) {
            cylinder(r=screw_countersink_d/2, h=top_plate_h+2, $fn=60);
        }

        translate([top_plate_w/2 - top_plate_screw_hole_inset, top_plate_d/2, -1]) {
            cylinder(r=screw_hole_d/2, h=top_plate_h+2, $fn=60);
        }
        translate([top_plate_w/2 - top_plate_screw_hole_inset, top_plate_d/2, top_plate_h-1]) {
            cylinder(r=screw_countersink_d/2, h=top_plate_h+2, $fn=60);
        }
    }
}

module card_guide() {
    rotate([90, 0, 0]) {
        back_plate();

        translate([-clip_w*3, 0, 0]) { clip_assembly(); }
        translate([-clip_w*2, 0, 0]) { clip_assembly(); }
        translate([-clip_w*1, 0, 0]) { clip_assembly(); }
        clip_assembly();
        translate([clip_w*1, 0, 0])  { clip_assembly(); }
        translate([clip_w*2, 0, 0])  { clip_assembly(); }
        translate([clip_w*3, 0, 0])  { clip_assembly(); }

        translate([0, top_plate_h, -top_plate_d]) {
            rotate([90, 0, 0]) {
                top_plate_with_screw_holes();
            }
        }
    }
}

//clip_assembly();

card_guide();
