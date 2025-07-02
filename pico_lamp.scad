// Pi Pico lamp project
// 45678911234567892123456789312345678941234567895123456789612345678971234567898

use <pico_lamp_top.scad>;

$fn = 200;
FUDGE = 0.001;

center_h = 65.0;
center_d = 30.0;
bottom_thick = 3.0;
pico_width = 21.5;
pico_board_l = 50.1; // without USB
pico_thick = 3.5; // without wire relief
center_room = 10.0;
wire_hole = 14.0;

outer_d = 92.0;
base_strip_w = 12.0;
tab_rise = 3.8;

// inside
union() {
  // central pillar
  difference() {
    cylinder(h=center_h, d=center_d);
    translate([-center_room, -pico_width/2, bottom_thick])
      cube([pico_board_l, pico_width, pico_width]);
    translate([-wire_hole/2, 0, wire_hole/2+bottom_thick*2])
      rotate([45, 0, 0])
        cube([wire_hole+2, wire_hole, wire_hole], center = true);
    // this is a tweeked 45 deg cut so that we don't need support
    translate([center_d/2+16.67, 0, 24.5])
      rotate([0, 45, 0])
        cube([center_d, center_d, center_d], center = true);
  }
  // base
  difference() {
    translate([0, 0, bottom_thick/2])
      union() {
        cube([outer_d, base_strip_w, bottom_thick], center = true);
        cube([base_strip_w, outer_d, bottom_thick], center = true);
      }
    difference() {
      cylinder(h=bottom_thick*3, d=outer_d+3, center=true);
      cylinder(h=bottom_thick*4, d=outer_d, center=true);
    }
  }
  // tabs
  difference() {
    union() {
      translate([0, outer_d/2 - bottom_thick*1.5,
                base_strip_w/2+bottom_thick-FUDGE])
        cube([base_strip_w, bottom_thick, base_strip_w], center=true);
      translate([0, -(outer_d/2 - bottom_thick*1.5),
                base_strip_w/2+bottom_thick-FUDGE])
        cube([base_strip_w, bottom_thick, base_strip_w], center=true);
    }
    difference() {
      cylinder(h=base_strip_w*3, d=outer_d, center=true);
      cylinder(h=base_strip_w*4, d=outer_d-bottom_thick*2, center=true);
    }
  }
  // bumps
  translate([0, outer_d/2 - bottom_thick*1.2,
            base_strip_w/2+bottom_thick+tab_rise])
    sphere(d=bottom_thick);
  translate([0, -(outer_d/2 - bottom_thick*1.2),
            base_strip_w/2+bottom_thick+tab_rise])
    sphere(d=bottom_thick);
  // bottom ring
  difference() {
    cylinder(h=bottom_thick, d=outer_d);
    cylinder(h=bottom_thick*3, d=outer_d-2*bottom_thick, center=true);
  }
}

/*
translate([0, 0, center_h+1+bottom_thick])
  rotate([180, 0, 0])
    color("blue", 0.3) Cover();
*/
