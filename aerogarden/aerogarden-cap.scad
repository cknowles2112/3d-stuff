$fn=100;

// This is a blank cap for aerobed hydroponics gardens
//My printer is printing 1mm too small in X, Y.  
mainRad = (38+1)/2;
insideRad = (31+1)/2;
lipheight = 2.4;
ringinset = 0.5;
ringheight = 1;
//make a polygon for the crosssection.  We'll rotate it to get the full item.

pointArry = [[mainRad, lipheight+ringheight],
            [0, lipheight+ringheight],
            [0,0],
            [insideRad-ringinset, 0],
            [insideRad-ringinset, ringheight],
            [insideRad, ringheight],
            [mainRad, lipheight+ringheight]];

rotate([0,180,0]) rotate_extrude() polygon(points = pointArry);

