module Entretoise()
{
    cylinder(h = 5, r = 1);
}    

module Fix_Pelle()
{
    cylinder(h = 5, r = 1.5);
}

module Pass_Tirap()
{
    cube([2, 5, 5], true);
}    

module Support_MOT()
{
    difference()
    {
        cube([16, 25, 5], true);
        cube([12, 25, 5], true);
    }    
}    

module TCRT5K()
{
    cube([5, 10, 25], true);
}

module Vision_Capteur()
{
    cube([5, 8, 5], true);
}

// BASE
color("green")
{
    union()
    {
        difference()
        {
            // Base Chassis
            translate([-55, -40, 0]) cube([85, 80, 5]);
    
            // Passage Roues
            translate([0, -37.5, 2.5]) cube([60, 5, 5], true);
            translate([0,  37.5, 2.5]) cube([60, 5, 5], true);
    
            // ...
            translate([-35, -10, 0]) cube([50, 20, 5]);
    
            // Support PCB 
            translate([-35, -20, 0]) Entretoise();
            translate([-35,  20, 0]) Entretoise();
            translate([ 15, -20, 0]) Entretoise();
            translate([ 15,  20, 0]) Entretoise();
    
            // Attache MOT G
            translate([-10, -30, 2.5]) Pass_Tirap();
            translate([-10, -15, 2.5]) Pass_Tirap();
            translate([ 10, -30, 2.5]) Pass_Tirap();
            translate([ 10, -15, 2.5]) Pass_Tirap();
    
            // Attache MOT D
            translate([-10,  30, 2.5]) Pass_Tirap();
            translate([-10,  15, 2.5]) Pass_Tirap();
            translate([ 10,  30, 2.5]) Pass_Tirap();
            translate([ 10,  15, 2.5]) Pass_Tirap();
    
            // Attache Pelle
            translate([-45, -15, 0]) Fix_Pelle();
            translate([-45,  15, 0]) Fix_Pelle();
    
            // Passage Capteurs TCRT
            translate([-42.5, -29, 2.5]) rotate(a = [0, 0,  15]) TCRT5K();
            translate([-42.5,  29, 2.5]) rotate(a = [0, 0, -15]) TCRT5K();
            translate([ 25,   0, 2.5]) TCRT5K();
    
            // Passage Batterie
            translate([30, -15, 0]) cylinder(h = 5, r = 5);
        
            // Vis assemblage
            translate([-35, -30, 0]) cylinder(h = 5, r = 1);
            translate([-35,  30, 0]) cylinder(h = 5, r = 1);
            translate([-25, -15, 0]) cylinder(h = 5, r = 1);
            translate([-25,  15, 0]) cylinder(h = 5, r = 1);
            translate([ 22.5, 15, 0]) cylinder(h = 5, r = 1);
        }    

        translate([0, -22.5, -2.5]) Support_MOT();
        translate([0,  22.5, -2.5]) Support_MOT();
    }
}    

// BATTERIE
color("red")
{
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
}

// CAPOT BATTERIE
color("black")
{
    difference()
    {
        // Base
        translate([-50, -40, -25]) cube([80,80,1]);
    
        // Passage Roues
        translate([0, -32.5, -25]) cube([60, 15, 2], true);
        translate([0,  32.5, -25]) cube([60, 15, 2], true);
    
        // Passage Cable Batterie
        translate([25, -17.5, -25]) cube([10,15,2], true);
    
        // Passage Capteurs TCRT
        translate([-42.5, -29, -25]) rotate(a = [0, 0,  15]) TCRT5K();
        translate([-42.5,  29, -25]) rotate(a = [0, 0, -15]) TCRT5K();
        translate([ 25,   0, -25]) TCRT5K();
    
        // Vis assemblage
        translate([-35, -30, -26]) cylinder(h = 2, r = 1);
        translate([-35,  30, -26]) cylinder(h = 2, r = 1);
        translate([ 22.5,  15, -26]) cylinder(h = 2, r = 1);
    } 
}

// CAPOT ROBOT
color("black")
{
    difference()
    {
        // Base Chassis
        translate([-50, -40, 5]) cube([80, 80, 40]);
    
        // Passage Roues
        translate([0, -37.5, 25]) cube([60, 5, 40], true);
        translate([0,  37.5, 25]) cube([60, 5, 40], true);
    
        // Evidement interne
        translate([-7.5, 0, 25]) cube([71, 66, 40], true);
        translate([-42.5, 0, 25]) cube([21, 76, 40], true);
        
        // Vision Capteur
        translate([ 27.5, 0, 25]) Vision_Capteur();
        
        // Passage Batterie
        translate([27.5, -15, 5])cube([5, 10, 10], true);
        translate([27.5, -15, 10]) rotate(a = [0, 90,  0]) cylinder(h = 5, r = 5);
    }
}
// PELLE
color("blue")
{
    // Partie Haute
    union()
    {
        difference()
        {
            // Base
            translate([-55, -50, 5]) cube([15, 100, 40]);
            translate([ -50, -50, 10]) cube([10, 100, 35]);
    
            // Pattes de fixations
            translate([-45, -35, 7.5]) cube([10, 30, 5], true);
            translate([-45,  35, 7.5]) cube([10, 30, 5], true);
            translate([-45,   0, 7.5]) cube([10, 20, 5], true);
            translate([-45, -15, 5]) cylinder(h = 5, r = 1.5);
            translate([-45,  15, 5]) cylinder(h = 5, r = 1.5);
    
            // Vision Capteur
            translate([ -52.5, 0, 25]) Vision_Capteur();
        }
    
        // Support Capteur
    
        // Remplissage bord pelle
        translate([-52.5, -45, 2.5]) cube([5, 10, 5], true);
        translate([-52.5,  45, 2.5]) cube([5, 10, 5], true);
    }
    
    // Partie Basse
    difference()
    {
        // Base
        translate([-70, -50, -30]) cube([30, 100, 30]);
        translate([-70, -50, -25]) cube([15, 100, 25]);
        translate([ -50, -50, -30]) cube([10, 100, 25]);
    
        // Pattes de fixations
        translate([-45, -35, -2.5]) cube([10, 30, 5], true);
        translate([-45,  35, -2.5]) cube([10, 30, 5], true);
        translate([-45,   0, -2.5]) cube([10, 20, 5], true);
        translate([-45, -15, -5]) cylinder(h = 5, r = 1.5);
        translate([-45,  15, -5]) cylinder(h = 5, r = 1.5);
    
        // Forme
        translate([ -64, 0, -25]) rotate(a = [0,-17,0]) cube([16, 100, 5], true);
    }
    
}    