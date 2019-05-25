//New Attempt at marking bead for wire
//typeface should be fixedwidth
$fn=60;
wire_diam=2.6;
//bead_diam=6;
//typeface="Liberation Mono";
//width_lib_mono=2.9;
//pins="JOY1";
//font_height=1;

module marking_cyl(string1, string2,
    typeface="Liberation Mono",
    typeface_width=2.9,
    font_height=1,
    bead_diam=6,
    wire_diam=2.6,
    detent_diam=3,
    detent_width=1
    ) {
    
    height1=len(string1)*typeface_width;
    height2=len(string2)*typeface_width;
    
    height = height1>=height2 ? height1 : height2;
        
    detent_height = height+1;    
        
    difference() {
//        rotate([0,-90,90])translate([0.5,0,((bead_diam/2)-1)]) difference() {
//            difference() {
//                translate([-0.5,0,((bead_diam/2)-1)*-1]) rotate([0,90,0]) cylinder(d=bead_diam, h=height+1);
//            color("red") linear_extrude(height=font_height) text(font=typeface, text=string, size=(bead_diam+1)/2, halign="left", valign="center");
//        }
//    }
        cylinder(d=bead_diam, h=detent_height);
    #   translate([0,(bead_diam/2)-font_height,0.5]) rotate([180,-90,90])  color("red") linear_extrude(height=font_height) text(font=typeface, text=string1, size=(bead_diam+1)/2, halign="left", valign="center");
#   translate([0,-1*((bead_diam/2)-font_height),height+0.5]) rotate([90,90,0])  color("red") linear_extrude(height=font_height) text(font=typeface, text=string2, size=(bead_diam+1)/2, halign="left", valign="center");

        translate([0,-1.3,-1]) cube([3,wire_diam,15]);
        translate([0,0,-1]) cylinder(h=15, d=2.6);
        
    }
    translate([wire_diam,wire_diam/2,(detent_height)/4-detent_diam/2]) rotate([90,0,-90]) linear_extrude(height=detent_width, center=false, scale=0.9) translate([0,0,0]) polygon(points=[[0,0],[0,detent_diam],[detent_diam/2,detent_diam/2]]);
    
    translate([wire_diam,-(wire_diam/2),((detent_height))*4/4-detent_diam/2]) rotate([-90,0,90]) linear_extrude(height=detent_width, center=false, scale=0.9) translate([0,0,0]) polygon(points=[[0,0],[0,detent_diam],[detent_diam/2,detent_diam/2]]);

}

//translate([10,10,0]) marking_cyl(string1="JOY1", string2="1,15");

//translate([10+2.6,10+1.3,((4*2.9)+1)/4-1.5]) rotate([90,0,-90]) linear_extrude(height=1, center=false, scale=0.9) translate([0,0,0]) polygon(points=[[0,0],[0,3],[1.5,1.5]]);
//
//translate([10+2.6,10-1.3,((4*2.9)+1)*4/4-1.5]) rotate([-90,0,90]) linear_extrude(height=1, center=false, scale=0.9) translate([0,0,0]) polygon(points=[[0,0],[0,3],[1.5,1.5]]);

//difference() {
//*    cylinder(d=6, h=2.9*4+1);
//#   translate([0,2,0]) rotate([180,-90,90])  color("red") linear_extrude(height=1) text(font="Liberation Mono", text="JOY1", size=(6+1)/2, halign="left", valign="center");
//#   translate([0,-2,2.9*4]) rotate([90,90,0])  color("red") linear_extrude(height=1) text(font="Liberation Mono", text="JOY1", size=(6+1)/2, halign="left", valign="center");
//}

GroundNames = [" FL ", " CD ", "  P ", "  V ", " AH ", " AS ", "  S ", " TO ", " TF ", " SA ", "SLED", " A1 ", "  R ", "RLED", "  G ", "GLED", "  L ", "LLED", " A2 ", " A3 ", " A4 ", "  N ", "  Z ", " TI ", "  B ", "BLED", " A5 ", " MT ", " CJ ", " ST ", "CALD", "COLD", "AGLD" ];
ControlNames = [" FLU", " FLD", " FLL", " FLR", " CD ", "CALD", "COLD", "AGLD", " P  ", "  V ", " AH ", " AP ", " AR ", " AM ", "  S ", " TN ", " TF ", " SA ", "SLED", " A1 ", " R  ", "RLED", "  G ", "GLED", "  L ", "LLED", " A2 ", " A3 ", " A4 ", "  N ", " ZI ", " ZO ", " TIF", " TIS", "  B ", "BLED", " A5 ", "MTU ", "MTD ", "CJU ", "CJD ", "CJL ", "CJR ", "STU ", "STD " ];

ControlPins =  ["0,8", "0,9", "0,10", "0,11", "0,12", "0,13", "0,14", "0,15", "1,8", "1,9", "1,10", "1,11", "1,12", "1,13", "1,14", "1,15", "0,0", "0,1", "0,2", "0,3", "0,4", "0,5", "0,6", "0,7", "1,0", "1,1", "1,2", "1,3", "1,4", "1,5", "1,6", "1,7", "2,0", "2,1", "2,2", "2,3", "2,4", "2,5", "2,6", "3,15", "3,0", "3,1", "3,2", "3,3", "3,4"];

for (i = [0:len(ControlNames)-1]) {
    translate([i*10,0,0]) marking_cyl(string1=ControlNames[i], string2=ControlPins[i]);
}

//for (i = [0:len(GroundNames)-1]) {
//    translate([i*10,0,0]) marking_cyl(string1=GroundNames[i], string2=GroundNames[i]);
//}
