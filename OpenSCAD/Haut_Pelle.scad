module Vision_Capteur()
{
    cube([5, 8, 5], true);
}

union()
{
    difference()
    {
        // Base
        translate([-10, -50, 0]) cube([15, 100, 40]);
        translate([ -5, -50, 5]) cube([10, 100, 35]);
    
        // Pattes de fixations
        translate([ 0, -35, 2.5]) cube([10, 30, 5], true);
        translate([ 0,  35, 2.5]) cube([10, 30, 5], true);
        translate([ 0,   0, 2.5]) cube([10, 20, 5], true);
        translate([ 0, -15, 0]) cylinder(h = 5, r = 1.5);
        translate([ 0,  15, 0]) cylinder(h = 5, r = 1.5);
    
        // Vision Capteur
        translate([ -7.5, 0, 20]) Vision_Capteur();
    }
    
    // Support Capteur
    
    // Remplissage bord pelle
    translate([-7.5, -45, -2.5]) cube([5, 10, 5], true);
    translate([-7.5,  45, -2.5]) cube([5, 10, 5], true);
}    
    