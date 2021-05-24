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

blade_offset = (pcb_thickness+pcb_clearance)/2 + blade_thickness/2;

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

module blade() {
    translate([-blade_thickness/2, 0, 0]) {
        cube([blade_thickness, backplate_d, blade_len-blade_thickness]);
    }
    translate([0, 0, blade_len-blade_thickness]) {
        blade_tip();
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

clip_assembly();

//blade_tip();

//blade();