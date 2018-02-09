$fn=100;
//need the threads library from http://dkprojects.net/openscad-threads/
use <threads.scad>

module bowlcutout(rad=16, drop=4, height=11) {
	translate([0,0,drop]) resize([rad*2,rad*2,height]) sphere(rad);
}

difference() {
	union() {
		translate([0,0,-4]) cylinder(r=55,h=15, center=true);
		metric_thread(diameter=12.5,  pitch=2, length=8);
	}
	
	for(i=[0:60:360]) {

		translate([sin(i)*37,cos(i)*37,0]) bowlcutout();
	}
	
	for(i=[0:5:360]) {
		translate([sin(i)*55, cos(i)*55, -4]) cylinder(r=0.75, h=14, center=true);
	}

}

