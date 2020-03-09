include <librairie.scad>;

module Fix_Pelle()
{
    cylinder(h = 5, r = 1.5);
}

module Support_MOT()
{
    difference()
    {
        cube([16, 25, 5], true);
        cube([12, 25, 5], true);
    }    
}    

module Chassis()
{
    union()
    {
        difference()
        {
            Base_Chassis(5);
    
            // Evidement
            translate([-35, -10, 0]) cube([50, 20, 5]);
    
            // Support PCB 
            Pass_Vis(-35, -20, 0, 5);
            Pass_Vis(-35,  20, 0, 5);
            Pass_Vis( 15, -20, 0, 5);
            Pass_Vis( 15,  20, 0, 5);
    
            // Attache MOT G
            Pass_Tirap(-10, -30, 2.5);
            Pass_Tirap(-10, -15, 2.5);
            Pass_Tirap( 10, -30, 2.5);
            Pass_Tirap( 10, -15, 2.5);
    
            // Attache MOT D
            Pass_Tirap(-10,  30, 2.5);
            Pass_Tirap(-10,  15, 2.5);
            Pass_Tirap( 10,  30, 2.5);
            Pass_Tirap( 10,  15, 2.5);
    
            // Attache Pelle
            translate([-45, -15, 0]) Fix_Pelle();
            translate([-45,  15, 0]) Fix_Pelle();
    
            // Passage Capteurs TCRT
            //rotate(a = [0, 0,  15]) 
            TCRT5K(-42.5, -29, 2.5);
            //rotate(a = [0, 0, -15]) 
            TCRT5K(-42.5,  29, 2.5);
            TCRT5K( 25,   0, 2.5);
    
            // Passage Batterie
            translate([30, -15, 0]) cylinder(h = 5, r = 5);
        
            // Vis assemblage
            Pass_Vis(-35, -30, 0, 5);
            Pass_Vis(-35,  30, 0, 5);
            Pass_Vis(-25, -15, 0, 5);
            Pass_Vis(-25,  15, 0, 5);
            Pass_Vis( 22.5, 15, 0, 5);
        }    

        translate([0, -22.5, -2.5]) Support_MOT();
        translate([0,  22.5, -2.5]) Support_MOT();
    }
}

Chassis();