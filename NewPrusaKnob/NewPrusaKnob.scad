//need the knurled lib from https://www.thingiverse.com/thing:9095
use <knurledFinishLib.scad>

$fn=50;

//knurled_cyl(15,17,4 ,4,1,3,25);
cylheight=4.5;
cylrad=6/2;

//echo(cylrad);
difference() {
//	cylinder(r=7,h=5);
	union() {
		knurled_cyl(8,17,3,3,1.5,1.5,50);
		translate([8,0,0]) knurled_cyl(8,5,3,3,1,1,50);
		translate([-8,0,0]) knurled_cyl(8,5,3,3,1,1,50);
		translate([0,8,0]) knurled_cyl(8,5,3,3,1,1,50);
		translate([0,-8,0]) knurled_cyl(8,5,3,3,1,1,50);

	}

	union() {
		
		translate([cylrad-1,-1,0]) cube([4,2,cylheight]);
		difference() {
			translate([0,0,0]) cylinder(r=cylrad*2,h=cylheight);
			translate([0,0,0]) cylinder(r=cylrad*2-1,h=cylheight);
			translate([-10,-10,-1]) cube([10,20,cylheight+2]);
		}
	translate([0,0,-1])cylinder(r=cylrad, h=cylheight+1);
	}
	translate([0,0,8.5]) resize([14,14,4]) sphere(r=8,center=true);

}
translate([0,-8,7.5]) sphere(r=2,center=true);
translate([0,8,7.5]) sphere(r=2,center=true);
translate([8,0,7.5]) sphere(r=2,center=true);
translate([-8,0,7.5]) sphere(r=2,center=true);
