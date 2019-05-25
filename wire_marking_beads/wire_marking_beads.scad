$fn=100;

wire_diam=2.3;
height=2;
sphere_size=4;
module bead(wire_diam, height, sphere_size) {
    difference() {
        intersection() {
            sphere(sphere_size,center=true);
            cube([10,10,height],center=true);
        }
        cylinder(h=10,d=wire_diam,center=true);
    }
}

for (i=[0:5]) {
    diam = 1.7+i/10;
    translate([i*10,0,0]) bead(diam, height, sphere_size);
}