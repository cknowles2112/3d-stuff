$fn=50;

//This is a jig to help strip hookup wire to given purpose lengths.

//the depth of wire to go into a screw terminal block
terminal_depth=4.25;
//length I like for twisting to a solder lug
solder_lug= 9;
//length I like for wrapping/joining to resistor and other inline components
resistor_wrap= 16;
//The thickness of your wire stripper blade.  1/2 of overall thickness
blade_thickness = 1.8;
//total diameter of the wire
wire_diameter = 2.3;

jig_diameter = wire_diameter*5;

//Base is the platform this is built on
base_thickness = 4;
//The thickness of the bottom of the holes.
floor_thickness = 1;

jig_y = 13;
lug_x = 21;
wrap_x = 35;
term_x = 7;

//Below here are derived values from above variables.
term_ztrans = max(floor_thickness, base_thickness+1-(terminal_depth-blade_thickness));

lug_ztrans = max(floor_thickness, base_thickness+1-(solder_lug-blade_thickness));

wrap_ztrans = max(floor_thickness, base_thickness+1-(resistor_wrap-blade_thickness));


difference() {
    #cube([42,20,base_thickness]);
    translate([lug_x,jig_y,lug_ztrans])    cylinder(d=jig_diameter, h=solder_lug-blade_thickness);
    translate([wrap_x,jig_y,wrap_ztrans])     cylinder(d=jig_diameter, h=resistor_wrap-blade_thickness);
    translate([term_x,jig_y,term_ztrans])     cylinder(d=jig_diameter, h=terminal_depth-blade_thickness);

}
//solder_lug
translate([lug_x,jig_y,lug_ztrans]) difference() {
    cylinder(d=jig_diameter, h=solder_lug-blade_thickness);
    cylinder(d=wire_diameter, h=solder_lug-blade_thickness+1);
}

//resistor_wrap
translate([wrap_x,jig_y,wrap_ztrans]) difference() {
    cylinder(d=jig_diameter, h=resistor_wrap-blade_thickness);
    cylinder(d=wire_diameter, h=resistor_wrap-blade_thickness+1);
}

//terminal_depth
//needs better parameterization of Z translate
translate([term_x,jig_y,term_ztrans]) difference() {
    cylinder(d=jig_diameter, h=terminal_depth-blade_thickness);
    cylinder(d=wire_diameter, h=terminal_depth-blade_thickness+1);
}

color("red") translate([lug_x,3,base_thickness]) linear_extrude(height=1) text(font="Hack:style=bold", "Lug", size=4, halign="center");

color("red") translate([wrap_x,3,base_thickness]) linear_extrude(height=1) text(font="Hack:style=bold", "Wrap", size=4, halign="center");

color("red") translate([term_x,3,base_thickness]) linear_extrude(height=1) text(font="Hack:style=bold", "Term", size=4, halign="center");
