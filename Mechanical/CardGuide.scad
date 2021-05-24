// all dimensions are mm

// backplate mounted on the card cage rails
backplate_d = 15;
backplate_h = 3;

// width of one unit, reflects spacing of backplane connectors,
// which are 0.75" apart
clip_w = 0.75 * 25.4;

// thickness of PCBs
pcb_thickness = 1.6;

// total clearance between guide clips and PCBs
pcb_clearance = 1.0;

// thickness of blade walls
blade_thickness = 3;
// amount by which blade protrudes from the backplate
blade_len = 10;

// offset of center of blade from center of clip assembly
blade_offset = (pcb_thickness+pcb_clearance)/2 + blade_thickness/2;

// total backplate width (excepting rounded ends and screw holes)
backplate_w = 7*clip_w;

// inset of backplate screw holes from ends
backplate_screw_hole_inset = 0;

// screw hole diameter
screw_hole_d = 3.4; // appropriate for M3 screw

// diameter of countersink cutout for screws
screw_countersink_d = 6; // screw heads are about 5mm in diameter

// half cylinder for top of clip blade
module blade_tip() {
    difference() {
        rotate([-90, 0, 0]) {
            cylinder(r=blade_thickness/2, h=backplate_d, $fn=60);
        }
        translate([-blade_thickness, -blade_thickness, -blade_thickness*2]) {
            cube([blade_thickness*2, backplate_d+blade_thickness*2, blade_thickness*2]);
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
    translate([0, backplate_d, 0]) {
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
        cube([blade_thickness, backplate_d, blade_len-blade_thickness]);
    }
    translate([0, 0, blade_len-blade_thickness]) {
        blade_tip_with_bevel();
    }
}

module clip_assembly() {
    translate([-clip_w/2, 0, 0]) {
        cube([clip_w, backplate_d, backplate_h]);
    }
    translate([-blade_offset, 0, backplate_h]) {
        blade();
    }
    translate([blade_offset, 0, backplate_h]) {
        blade();
    }
}

module backplate() {
    translate([-backplate_w/2, 0, 0]) {
        cube([backplate_w, backplate_d, backplate_h]);
        translate([0, backplate_d/2, 0]) {
            cylinder(r=backplate_d/2, h=backplate_h, $fn=60);
        }
        translate([backplate_w, backplate_d/2, 0]) {
            cylinder(r=backplate_d/2, h=backplate_h, $fn=60);
        }
    }
}

module card_guide() {
    backplate();

    translate([-clip_w*3, 0, 0]) { clip_assembly(); }
    translate([-clip_w*2, 0, 0]) { clip_assembly(); }
    translate([-clip_w*1, 0, 0]) { clip_assembly(); }
    clip_assembly();
    translate([clip_w*1, 0, 0])  { clip_assembly(); }
    translate([clip_w*2, 0, 0])  { clip_assembly(); }
    translate([clip_w*3, 0, 0])  { clip_assembly(); }
}

module card_guide_with_screw_holes() {
    difference() {
        card_guide();
        translate([-backplate_w/2 + backplate_screw_hole_inset, backplate_d/2, -1]) {
            cylinder(r=screw_hole_d/2, h=backplate_h+2, $fn=60);
        }
        translate([-backplate_w/2 + backplate_screw_hole_inset, backplate_d/2, backplate_h-1]) {
            cylinder(r=screw_countersink_d/2, h=backplate_h, $fn=60);
        }

        translate([backplate_w/2 - backplate_screw_hole_inset, backplate_d/2, -1]) {
            cylinder(r=screw_hole_d/2, h=backplate_h+2, $fn=60);
        }
        translate([backplate_w/2 - backplate_screw_hole_inset, backplate_d/2, backplate_h-1]) {
            cylinder(r=screw_countersink_d/2, h=backplate_h, $fn=60);
        }
    }
}

//clip_assembly();

card_guide_with_screw_holes();
