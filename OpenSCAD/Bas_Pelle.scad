difference()
{
    // Base
    translate([-25, -50, -30]) cube([30, 100, 30]);
    translate([-25, -50, -25]) cube([15, 100, 25]);
    translate([ -5, -50, -30]) cube([10, 100, 25]);
    
    // Pattes de fixations
    translate([ 0, -35, -2.5]) cube([10, 30, 5], true);
    translate([ 0,  35, -2.5]) cube([10, 30, 5], true);
    translate([ 0, 0, -2.5]) cube([10, 20, 5], true);
    translate([  0, -15, -5]) cylinder(h = 5, r = 1.5);
    translate([  0,  15, -5]) cylinder(h = 5, r = 1.5);
    
    // Forme
    translate([ -19, 0, -25]) rotate(a = [0,-17,0]) cube([16, 100, 5], true);
}
