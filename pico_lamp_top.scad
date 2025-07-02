// Top for Pi Pico lamp project
// 45678911234567892123456789312345678941234567895123456789612345678971234567898

$fn = 200;
FUDGE = 0.001;

center_h = 67.0;
center_d = 30.0;
thick = 3.0;
USB_thick = 6.5; // without wire relief
USB_width = 10.5;
wall = 1.2;

outer_d = 92.0;
base_strip_w = 12.0;
tab_rise = 3.8;

module Cover() {
  difference() {
    cylinder(h=center_h+1, d=(outer_d-(2*(thick-wall)))+0.2);
    translate([0, 0, wall])
      cylinder(h=center_h, d=(outer_d-2*thick)+0.2);
    translate([0, outer_d/2 - thick*1.2,
            (center_h+1)-(base_strip_w/2+tab_rise)])
      sphere(d=thick);
    translate([0, -(outer_d/2 - thick*1.2),
            (center_h+1)-(base_strip_w/2+tab_rise)])
      sphere(d=thick);
    // hole for USB
    translate([outer_d/2, 0, (center_h+1)-USB_thick/2])
      cube([thick*3, USB_width, USB_thick+FUDGE], center=true);
  }
}

Cover();