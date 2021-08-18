plate_w = 11.8;
plate_d = 3.6 * 2;
plate_h = 4;

// M3 screw hole (diameter)
screw_hole_w = 3.4;

nut_w = 5.6; // square nuts are 5x5 mm, leave a bit extra for clearance
nut_h = 2;

lip_d = 2;

pcb_thickness = 1.6;

// height of rectangular plastic housing of the 40x2 female right angle header
connector_h = 5;

clip_wall_w = 2;
clip_wall_d = plate_d + 2*lip_d;
clip_wall_h = connector_h - plate_h + lip_d;

overhang_w = lip_d;
overhang_d = clip_wall_d;

module plate() {
    translate([-plate_w/2, -plate_d/2, 0]) {
        cube([plate_w, plate_d+lip_d, plate_h]);
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

module clip_wall() {
    translate([-clip_wall_w/2, -clip_wall_d/2, 0]) {
        cube([clip_wall_w, clip_wall_d, clip_wall_h]);
    }
}

// See: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
module prism(l, w, h){
   polyhedron(
       points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
       faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
   );
/*   
   // preview unfolded (do not include in your function
   z = 0.08;
   separation = 2;
   border = .2;
   translate([0,w+separation,0])
       cube([l,w,z]);
   translate([0,w+separation+w+border,0])
       cube([l,h,z]);
   translate([0,w+separation+w+border+h+border,0])
       cube([l,sqrt(w*w+h*h),z]);
   translate([l+border,w+separation+w+border+h+border,0])
       polyhedron(
           points=[[0,0,0],[h,0,0],[0,sqrt(w*w+h*h),0], [0,0,z],[h,0,z],[0,sqrt(w*w+h*h),z]],
           faces=[[0,1,2], [3,5,4], [0,3,4,1], [1,4,5,2], [2,5,3,0]]
       );
   translate([0-border,w+separation+w+border+h+border,0])
       polyhedron(
           points=[[0,0,0],[0-h,0,0],[0,sqrt(w*w+h*h),0], [0,0,z],[0-h,0,z],[0,sqrt(w*w+h*h),z]],
           faces=[[1,0,2],[5,3,4],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
       );
   */
}

module clip_wall_brace() {
    rotate([0, 0, -90]) {
        prism(l=lip_d, w=clip_wall_h, h=clip_wall_h);
    }
}

module clip_overhang() {
    translate([-overhang_w/2, -overhang_d/2, 0]) {
        cube([overhang_w, overhang_d, overhang_w]);
    }
}

// this is the left bracket, mirror for the right bracket
module left_bracket() {
    plate_with_screw_hole();
    translate([0, -plate_d/2 - lip_d/2, -pcb_thickness]) {
        lip();
    }
    translate([plate_w/2 - clip_wall_w/2, 0, plate_h]) {
        clip_wall();
    }
    translate([plate_w/2 - clip_wall_w - clip_wall_h + 0.01, -plate_d/2, plate_h-0.01]) {
        clip_wall_brace();
    }
    translate([plate_w/2 - clip_wall_w - clip_wall_h + 0.01, plate_d/2+lip_d, plate_h-0.01]) {
        clip_wall_brace();
    }
    translate([plate_w/2 + overhang_w/2 - 0.01, 0, connector_h]) {
        clip_overhang();
    }
}

module right_bracket() {
    mirror([1, 0, 0]) {
        left_bracket();
    }
}

// the brackets seem to print fine without supports
// (I guess because the overhangs are small)

rotate([90, 0, 0]) {
    left_bracket();
}

//rotate([90, 0, 0]) {
//    right_bracket();
//}
