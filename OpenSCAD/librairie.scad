module Base_Chassis(h)
{
    difference()
    {
        // Base Chassis
        translate([-55, -40, 0]) cube([85, 80, h]);
    
        // Passage Roues
        translate([0, -37.5, 2.5]) cube([60, 5, h], true);
        translate([0,  37.5, 2.5]) cube([60, 5, h], true);
    }   
}    

module Pass_Tirap(pos_x, pos_y, pos_z)
{
    translate([pos_x, pos_y, pos_z]) cube([2, 5, 5], true);
}    

module Pass_Vis(pos_x, pos_y, pos_z, h)
{
    translate([pos_x, pos_y, pos_z]) cylinder(h = h, r = 1);
}

module TCRT5K(pos_x, pos_y, pos_z)
{
    translate([pos_x, pos_y, pos_z]) cube([5, 10, 5], true);
}