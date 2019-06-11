use <parametric_peg.scad>;

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

parametric_peg(cap_depth,
					cap_diam,
					bearing_depth,
					bearing_diam,
					lag_diam,
					lag_depth,
					retain_depth,
					retain_max_diam,
					retain_slit,
					retain_slit_depth);
