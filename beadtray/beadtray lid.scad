$fn=100;
// Need the threads library from http://dkprojects.net/openscad-threads/
use <threads.scad>

difference() {
	union() {
		cylinder(r=55,h=2,center=true);
		translate([0,0,1]) cylinder(r=8, h=9);
	}
	translate([0,0,-2]) metric_thread(diameter=13.2, pitch=2, length=15, internal=true);
	
	for(i=[0:22.5:360]) {
		translate([sin(i)*8,cos(i)*8,1.25])cylinder(r=0.75, h=8);
	}

}