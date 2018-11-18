$fn=50;

magnet_diam = 12.0; 
magnet_height =  3;

panel_x = 90;
panel_y = 30;



union () {
    difference() {
        cube([panel_x, panel_y, magnet_height/2+1.5]);
        translate([magnet_diam,panel_y/2,0]) cylinder(h=magnet_height/2+0.6, d=magnet_diam);
        translate([90-magnet_diam,panel_y/2,0]) cylinder(h=magnet_height/2+0.6, d=magnet_diam);
    }
    color("red") translate([panel_x/2,panel_y/2,magnet_height/2+1.4]) linear_extrude(height=1) text(font="Hack:style=bold", text="CLEAN", size=20, halign="center", valign="center");
}


translate ([0,45,0]) union () {
    difference() {
        cube([panel_x, panel_y, magnet_height/2+1.5]);
        translate([magnet_diam,panel_y/2,0]) cylinder(h=magnet_height/2+0.6, d=magnet_diam);
        translate([90-magnet_diam,panel_y/2,0]) cylinder(h=magnet_height/2+0.6, d=magnet_diam);
    }
    color("red") translate([panel_x/2,panel_y/2,magnet_height/2+1.4]) linear_extrude(height=1) text(font="Hack:style=bold", text="DIRTY", size=20, halign="center", valign="center");
}