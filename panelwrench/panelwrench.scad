$fn=50;

//A wrench to tighten buttons onto a panel, with hex nuts, and lots of wires.  Slip the wires through the slot, the wrench onto the nut, and tighten away


module general_poly(sides=6, height=10, radius=5, center=false) {
//sides = number of sides to the poly
//height = height of the linear extrude
//radius = distance from center point to vertex
//center = whether to center on Z axis
// Note: radius is related to sidelength...      
//    radius = (0.5*sidelength)/(sin(0.5*angle));
    angle = 360/sides;
    list = [ for (i=[0:angle:360]) [radius*cos(i),radius*sin(i)]];
    echo(list);
    linear_extrude(height=height, center=center) polygon(list);
}

//Overall height of the wrench
wrench_height=30;
//diameter from point-to-point of the nut
nut_diam=17.5;
//outside diameter of the wrench
wrench_diam=25;
slot_width=5;

difference() {
    cylinder(d=wrench_diam,h=wrench_height);
    rotate([0,0,30]) translate([0,0,-1]) general_poly(radius=nut_diam/2, height=wrench_height+2);
    #translate([0,-slot_width/2,-1]) cube([wrench_diam,slot_width,wrench_height+2]);
}