$fn=50;
//Whirlpool refrigerator drawer bearing peg:
cap_depth=1.6;
cap_diam=10.54;
bearing_depth=12.16;
bearing_diam=8.45;
lag_diam=5.3;
lag_depth=15.56;
retain_depth=4;
retain_max_diam=7.1;
retain_slit = 1;
retain_slit_depth = retain_depth+1.5;

module parametric_peg(cap_depth, //How tall is the cap
					cap_diam, //diameter of the cap
					bearing_depth, //height of the bearing section
					bearing_diam, //diameter of the bearing
					lag_diam, //diameter of the lag section
					lag_depth, //length of the lag section
					retain_depth, //length of the retaining barb
					retain_max_diam, //max diam of the barb. (min is lag_diam
					retain_slit, //How wide the slit is
					retain_slit_depth) { //How long the slit is, from tip to end of slit
	difference() {
		union() {
			//cap
			cylinder(d=cap_diam, h=cap_depth);
			//bearing
			cylinder(d=bearing_diam, h=bearing_depth);
			//lag
			cylinder(d=lag_diam, h=lag_depth);
			//retain
			translate([0,0,lag_depth]) cylinder(r1=retain_max_diam/2, r2=lag_diam/2, h=retain_depth);
		}
		translate([-retain_max_diam/2,-retain_slit/2,lag_depth+retain_depth-retain_slit_depth]) cube([retain_max_diam, retain_slit, retain_slit_depth]);
	}
}

