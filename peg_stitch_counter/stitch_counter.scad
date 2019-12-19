$fn=50;

//A peg and hole - intended to replace a peg-it knit board.

//make a board

Two functions -
  make_a_board - makes a stitch counter with the below params
  new_make_a_peg - makes pegs

thickness = 4;  //thickness of the board
holediam = 4;   //diameter of the peg hole

pegthumbheight = 10;  //height of the grip of the peg
pegthumbdiam = 6;     //diam of the grip
pegdiam = 3.75;       //diameter of the main peg

lip_height = 2;   //originally 1 --- the height of hte differently diam bit of peg
lip_diam = holediam + 0.25; //size for the lip to help retention

slot = 0.5;  //if you want to make a slotted peg - I found this to be too fragile.

panel_x = 152.4;  //X of the entire board
panel_y = 86.4;   //Y of the entire board

mini_panel_x = 76.2;  //X of the sub panel
mini_panel_y = 37;    //Y of the sub panel

top_panel_right_x = 86.2; //top line panel left X size
top_panel_left_x = 66.2;  //top line panel right X size
top_panel_y = 10;         //top line panel Y

panel_line_thick = 0.75;  //thickness of the decoration line
font_size=3.25;           //size of the marking font.


module make_a_hole(thickness, hole_diam, lip_height, lip_diam, tolerance = 0.1) {
    //Used to make a hole in the panel for the peg
    //thickness - the Z of the panel
    //hole_diam - the nominal hole size
    //lip_height - Z of the retention lip
    //lip_diam - diam of the retention lip
    //tolerance - the extra size of the hole.
    
    translate([0,0,0]) cylinder(h=thickness+.2, d=hole_diam, center=true);
    translate([0,0,lip_height/4-thickness/2+tolerance]) cylinder(h=lip_height/2, d=lip_diam, center=true);
    translate([0,0,lip_height/4+lip_height/2-thickness/2+tolerance]) cylinder(h=lip_height/2, r1=lip_diam/2, r2=hole_diam/2, center=true);
}


module make_a_peg(grip_height, grip_diam, pin_height, pin_diam, slot, lip_height, lip_diam) {
    union() {
        cylinder(h=grip_height, d=grip_diam, center=true);
        translate([0,0,pin_height/2+grip_height/2]) difference() {
            union () {
                cylinder(h=pin_height, d=pin_diam, center=true);
                translate([0,0,pin_height/2-lip_height+lip_height/4]) cylinder(h=lip_height/2, r1=pin_diam/2, r2=lip_diam/2, center=true);
                translate([0,0,pin_height/2-lip_height/4]) cylinder(h=lip_height/2, r2=pin_diam/2, r1=lip_diam/2, center=true);
                
            }
            cube([3*pin_diam,slot, 3*pin_height], center=true);
        }
    }
}

module new_make_a_peg(grip_height, grip_diam, pin_height, pin_diam, slot, lip_height, lip_diam, pointed_diam) {

//Make a tapered peg for easier insertion
//grip_height
//grip_diam
//pin_height
//pin_diam
//slot
//lip_height
//lip_diam
//pointed_diam

    union() {
        //The thumb of the peg
        #cylinder(h=grip_height, d=grip_diam, center=true);
        //The rest of the peg.  SLotted, with a pointed tip
        translate([0,0,pin_height/2+grip_height/2]) difference() {
            union () {
                translate([0,0,-lip_height/2]) cylinder(h=pin_height-lip_height, d=pin_diam, center=true);
                translate([0,0,pin_height/2-lip_height+lip_height/4]) cylinder(h=lip_height/2, r1=pin_diam/2, r2=lip_diam/2, center=true);
                translate([0,0,pin_height/2-lip_height/4]) cylinder(h=lip_height/2, r2=pointed_diam/2, r1=lip_diam/2, center=true);
                
            }
            cube([3*pin_diam,slot, 3*pin_height], center=true);
        }
    }
}

module textlabel(fontsize=4.5, typeface="Hack:style=bold", textproud=1,panelthickness=4, text) {
    //To make a label
    //fonsize = size to use - default is pretty much the smallest you want
    //typeface - the font to use - Hack is a nice readable
    //textproud - how far above the surface to go?
    //panelthickness - how thick is the panel we're writing on?
    //text = the text to display
    color("red") translate([0,0,panelthickness]) linear_extrude(height=textproud) text(font=typeface, text=text, size=fontsize, halign="center", valign="center");
}

module outline_square(thickness, outer_x, outer_y, line_thickness) {
    translate([outer_x/2, outer_y/2, thickness/2]) difference () {
        cube([outer_x, outer_y, thickness], center=true);
        cube([outer_x-2*line_thickness, outer_y-2*line_thickness, thickness+0.2], center=true);
    }
}

module quadrant_panel(X, Y, panel_thickness, line_thick, hole_diam, lip_diam, lip_height, title) {
    title_row = Y-5;
    title_x = (X-2*panel_line_thick)/2;
    top_number_row = title_row - 7;
    top_hole_row = top_number_row - 6;
    bottom_number_row = top_hole_row - 6;
    hole_row = bottom_number_row - 6;
    //make the small panel
    difference() {
        translate([-1,0,0]) cube([X, Y, thickness]);
    
        for (i=[5:7:68]) {
            #translate([i,hole_row,thickness/2]) make_a_hole(thickness=panel_thickness, hole_diam=holediam, lip_diam=lip_diam, lip_height=lip_height);            
        }
    
        for (i=[5:7:68]) {
            #translate([i,top_hole_row,thickness/2]) make_a_hole(thickness=panel_thickness, hole_diam=holediam, lip_diam=lip_diam, lip_height=lip_height);            
        }
    }
    color ("red") translate([-1,0,0])outline_square(panel_thickness+1, X,Y,line_thick);
    translate([title_x,title_row,0]) textlabel (textproud=1, fontsize=font_size, text=title);

    for (i=[1:10]) {
        translate([(i*7)-2,top_number_row,0]) textlabel (textproud=1, fontsize=font_size, text=str(i));   
    }
    for (i=[1:10]) {
        translate([(i*7)-2,bottom_number_row,0]) textlabel (textproud=1, fontsize=font_size, text=str(i*10));
    }    
}

module make_a_board () {
//put togeter all the quadrants and label things

    translate([0,mini_panel_y-panel_line_thick,0]) quadrant_panel(X=mini_panel_x, Y=mini_panel_y,  panel_thickness=thickness, line_thick = panel_line_thick, hole_diam = holediam, lip_diam = lip_diam, lip_height = lip_height, title="ROWS");
    translate([mini_panel_x-panel_line_thick,mini_panel_y-panel_line_thick,0]) quadrant_panel(X=mini_panel_x, Y=mini_panel_y, panel_thickness=thickness, line_thick = panel_line_thick, hole_diam = holediam, lip_diam = lip_diam, lip_height = lip_height, title="INCREASE - DECREASE");
    quadrant_panel(X=mini_panel_x, Y=mini_panel_y, panel_thickness=thickness, line_thick = panel_line_thick, hole_diam = holediam, lip_diam = lip_diam, lip_height = lip_height, title="PATTERN ROWS");
    translate([mini_panel_x-panel_line_thick,0,0]) quadrant_panel(X=mini_panel_x, Y=mini_panel_y, panel_thickness=thickness, line_thick = panel_line_thick, hole_diam = holediam, lip_diam = lip_diam, lip_height = lip_height, title="INCREASE-DECREASE-FINISHED");
    
    color("red") translate([-1,mini_panel_y*2-panel_line_thick*2,0]) outline_square(thickness+1, top_panel_left_x, top_panel_y, panel_line_thick);
    translate([-1,mini_panel_y*2-panel_line_thick*2,0]) cube([top_panel_left_x, top_panel_y, thickness]);
    
    translate([(top_panel_left_x-1)/2,mini_panel_y*2-panel_line_thick*2+ top_panel_y/2,0]) textlabel (textproud=1, fontsize=font_size, text="SCAREDSHEEP");
    
    color("red") translate([-1 + top_panel_left_x - panel_line_thick,mini_panel_y*2-panel_line_thick*2,0]) outline_square(thickness+1, top_panel_right_x, top_panel_y, panel_line_thick);
    difference() {
        translate([-1 + top_panel_left_x - panel_line_thick,mini_panel_y*2-panel_line_thick*2,0]) cube([top_panel_right_x, top_panel_y, thickness]);
        for (i=[1:10]) {
            translate([-1 + top_panel_left_x - panel_line_thick,mini_panel_y*2-panel_line_thick*2,0]) #translate([(i*8)-1,5,thickness/2]) make_a_hole(thickness=thickness, hole_diam=holediam, lip_diam=lip_diam, lip_height=lip_height);            
        }
        
    }
}

translate([0,100,0]) for (i = [1:10]) {
    translate([i*8,0,0]) new_make_a_peg(pegthumbheight, pegthumbdiam, thickness, 3.9, 0, lip_height, 3.9, 3);
}
make_a_board();
