$fn=50;
//Whirlpool refrigerator drawer bearing peg:
cap_depth=1.6;
cap_diam=10.54;
bearing_depth=12.16;
bearing_diam=8.45;
lag_diam=5.3;
lag_depth=15.56;
retain_depth=4;
retain_max_diam=6.9;
retain_slit = 1;

module parametric_peg(cap_depth,
					cap_diam,
					bearing_depth,
					bearing_diam,
					lag_diam,
					lag_depth,
					retain_depth,
					retain_max_diam,
					retain_slit) {
	union() {
		//cap
		cylinder(d=cap_diam, h=cap_depth);
		//bearing
		cylinder(d=bearing_diam, h=bearing_depth);
		//lag
		cylinder(d=lag_diam, h=lag_depth);
		//retain
		difference() {
			translate([0,0,lag_depth]) cylinder(r1=retain_max_diam/2, r2=lag_diam/2, h=retain_depth);
			translate([-retain_max_diam/2,-retain_slit/2,lag_depth]) cube([retain_max_diam, retain_slit, retain_depth]);
		}
	}
}

parametric_peg(cap_depth,
					cap_diam,
					bearing_depth,
					bearing_diam,
					lag_diam,
					lag_depth,
					retain_depth,
					retain_max_diam,
					retain_slit);