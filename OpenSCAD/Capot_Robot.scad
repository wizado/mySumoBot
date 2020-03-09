module Vision_Capteur(pos_x, pos_y, pos_z)
{
    translate([ pos_x, pos_y, pos_z]) cube([5, 8, 5], true);
}

difference()
{
    // Base Chassis
    translate([-50, -40, 0]) cube([80, 80, 40]);
    
    // Passage Roues
    translate([0, -37.5, 20]) cube([60, 5, 40], true);
    translate([0,  37.5, 20]) cube([60, 5, 40], true);
    
    // Evidement interne
    translate([-7.5, 0, 20]) cube([71, 66, 40], true);
    translate([-42.5, 0, 20]) cube([21, 76, 40], true);
    
    // Vision Capteur
    Vision_Capteur(27.5, -0, 20);
    
    // Passage Batterie
    translate([27.5, -15, 0])cube([5, 10, 10], true);
    translate([27.5, -15, 5]) rotate(a = [0, 90,  0]) cylinder(h = 5, r = 5);
}   