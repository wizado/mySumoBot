module TCRT5K()
{
    cube([5, 10, 24], true);
} 

difference()
{
    // Base
    translate([-50, -40, -24]) cube([80,80,24]);
    
    // Passage Roues
    translate([0, -32.5, -12]) cube([60, 15, 24], true);
    translate([0,  32.5, -12]) cube([60, 15, 24], true);
    
    // Passage Moteurs
    translate([0, 0, -7.5]) cube([30,70,15], true);
    
    // Emplacement Batterie
    translate([-15, 0, -16.5]) cube([70,40,15], true);
    
    // Passage Cable Batterie
    translate([25, -17.5, -12]) cube([10,15,24], true);
    
    // Passage Capteurs TCRT
    translate([-42.5, -29, -12]) rotate(a = [0, 0,  15]) TCRT5K();
    translate([-42.5,  29, -12]) rotate(a = [0, 0, -15]) TCRT5K();
    translate([ 25,   0, -12]) TCRT5K();
    
    // Passage Pelle
    translate([-42.5, 0, -5]) cube([15,40,10], true);
    
    // Vis assemblage
    translate([-35, -30, -24]) cylinder(h = 24, r = 1);
    translate([-35,  30, -24]) cylinder(h = 24, r = 1);
    translate([-25, -15, -24]) cylinder(h = 24, r = 1);
    translate([-25,  15, -24]) cylinder(h = 24, r = 1);
    translate([ 22.5,  15, -24]) cylinder(h = 24, r = 1);
}