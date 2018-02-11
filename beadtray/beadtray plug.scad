$fn=100;
// Need the threads library from http://dkprojects.net/openscad-threads/
use <threads.scad>
//need the knurled lib from https://www.thingiverse.com/thing:9095
use <knurledFinishLib.scad>

union() {
	translate([0,0,5]) metric_thread(diameter=12.5, pitch=2, length=4);
	knurled_cyl(5,16,2 ,2,1,3,0);
}