
use <screw_pegs.scad>




$fn=30;

servo_l = 40.5;
servo_w = 20;
servo_h = 30;//37.5;
wing_h=10;
wing_l=6.74;
wing_offset = 1.75;
tol = 0.2;
wall_t = 5;

screw_hole_d=3.2;
inter_screws_dist = 6.2;
screws_x_offset = 4;
screws_y_offset = 8;
servos_n = 4;

servo_shaft_d = 5.8;
servo_shaft_l = 3.2;

tube_d = 4;

mountZ=4;
mountX=10;

zipTieDist = 7;
verticalPoleX=screw_hole_d+5;
verticalPoleY=2.3;
verticalPoleZ=27;

valveHolderScrewX = screw_hole_d+5 ;
valveHolderScrewY = screw_hole_d+5;
valveHolderScrewZ = mountZ;
/*
module valve_holder(){
difference(){
cube([30,40,5]);
translate([7.5,-1,-1]){
cube([5,42,7]);
    
}//emnd translate
for (i=[4,15]){
    for (j=[15,25]){
translate([i,j,-5]){
cylinder(d=3,h=25);
    }//end translate
    
}//end for
}//end for
}//end difference

for (i=[-5,4*inter_screws_dist]){
    for (j=[-(servo_l/2+screw_hole_d/2+wing_offset)/2,35]){
    translate([i,j,5]){
    rotate([0,90,0]){
        cube([15,5,5]);
    }//end rotate
}//end translate
}//end for
}//end for


}//end module
*/
module holder(){
difference(){
    union(){
    for (y=[0,4*inter_screws_dist+5,0]){
        for (x = [servo_l/2+screw_hole_d/2+wing_offset,-(servo_l/2+screw_hole_d/2+wing_offset)]){
    

translate([x,y,0]){
cube([valveHolderScrewX,valveHolderScrewY,valveHolderScrewZ],center=true);
    
}//end translate

}//end for
}//end for

for (x=[servo_l/2+screw_hole_d/2+wing_offset,-(servo_l/2+screw_hole_d/2+wing_offset)])
translate([x,valveHolderScrewX/2-verticalPoleY/2,verticalPoleZ/2])
    cube([valveHolderScrewX,verticalPoleY,verticalPoleZ],center=true);

for (x=[servo_l/2+screw_hole_d/2+wing_offset,-(servo_l/2+screw_hole_d/2+wing_offset)])
translate([x,4*inter_screws_dist+5-(valveHolderScrewX/2-verticalPoleY/2),verticalPoleZ/2])
    cube([valveHolderScrewX,verticalPoleY,verticalPoleZ],center=true);



translate([0,25/2+verticalPoleY,verticalPoleZ]){
cube([55,25+verticalPoleY/2,3],center=true);
}//end translate
}//end union


union(){
translate([0,25/2+verticalPoleY,verticalPoleZ]){
    translate([-zipTieDist,-8,-15])
    cylinder(d=4,h=30);
    translate([-zipTieDist,8,-15])
    cylinder(d=4,h=30);
    translate([zipTieDist,-8,-15])
    cylinder(d=4,h=30);
    translate([zipTieDist,8,-15])
    cylinder(d=4,h=30);
    
    cube([screw_hole_d+65,6,10],center=true);
}//end translate

}//end union
}//end difference
}//end module
/*
translate([14,11,0]){
rotate([0,0,90]){
valve_holder();
}
}
*/

difference(){
translate([0,inter_screws_dist+screw_hole_d/2,0])
holder();
translate([0,0,10])
screw_pegs();
}