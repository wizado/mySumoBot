module TCRT5K()
{
    cube([5, 10, 1], true);
}

difference()
{
    // Base
    translate([-50, -40, -1]) cube([80,80,1]);
    
    // Passage Roues
    translate([0, -32.5, -0.5]) cube([60, 15, 1], true);
    translate([0,  32.5, -0.5]) cube([60, 15, 1], true);
    
    // Passage Cable Batterie
    translate([25, -17.5, -0.5]) cube([10,15,1], true);
    
    // Passage Capteurs TCRT
    translate([-42.5, -29, -0.5]) rotate(a = [0, 0,  15]) TCRT5K();
    translate([-42.5,  29, -0.5]) rotate(a = [0, 0, -15]) TCRT5K();
    translate([ 25,   0, -0.5]) TCRT5K();
    
    // Vis assemblage
    translate([-35, -30, -1]) cylinder(h = 1, r = 1);
    translate([-35,  30, -1]) cylinder(h = 1, r = 1);
    translate([ 22.5,  15, -1]) cylinder(h = 1, r = 1);
}    