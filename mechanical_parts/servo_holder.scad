use <screw_pegs.scad>


servo_l = 40.5;
servo_w = 20;
servo_h = 30;//37.5;
wing_h=10;
wing_l=6.74;
wing_offset = 1.75;
tol = 0.2;
wall_t = 5;

screw_hole_d=3.87;
inter_screws_dist = 6.2;
screws_x_offset = 4;
screws_y_offset = 8;
servos_n = 5;

servo_shaft_d = 5.8;
servo_shaft_l = 3.2;

tube_d = 4;


$fn=30;

module tube_holder(){
difference(){
cylinder(d=tube_d+wall_t+2*tol,h=20);
translate([0,0,-0.1])
cylinder(d=tube_d+2*tol,h=25);
}//end difference
}//end module


module servo_coupler(){
 difference(){
    union(){
    cylinder(d=servo_shaft_d+2*tol+wall_t/2,h=servo_shaft_l+8); 
    translate([-5/2,0,0]){
   cube([5,18,servo_shaft_l+2]); 
    }//end translate
}//end union
  translate([0,0,(servo_shaft_l+4)]){
    cylinder(d=servo_shaft_d+2*tol,h=servo_shaft_l+1);
 }//end translate
 translate([0,0,-0.1]){
    cylinder(d=5+2*tol,h=servo_shaft_l+2);
 }//end translate
   translate([-(2.5+2*tol)/2,0,-0.1]){
   cube([2.5+2*tol,16.4,servo_shaft_l]); 
    }//end translate
}//end difference
    }//end module


//servos_holder();
//    translate([-(wall_t+servo_l/2+screw_hole_d/2+wing_offset),-(inter_screws_dist+screw_hole_d)/2,0])
//screws_holes();


module servos_mount(){
difference(){
cube([servo_l+2*tol+20,(servos_n+1)*servo_w+2*wall_t,servo_h+wall_t],center=true);
    //cube([servo_l+2*tol+20,servos_n*servo_w+2*wall_t,10]);

translate([0,0,])
cube([servo_l+2*tol,(servos_n+1)*servo_w,servo_h+2*wall_t],center=true);    

translate([0,0,wall_t])
cube([servo_l+2*tol,(servos_n+1)*servo_w+3*wall_t,servo_h+wall_t],center=true);

translate([0,wall_t,wall_t])
cube([2*servo_l+2*tol-wall_t,(servos_n+1)*servo_w-2*wall_t,servo_h+wall_t],center=true);

/////////////////
    
    
    translate([servo_l/2+wall_t,-((servos_n/2)*servo_w)/2,0]){
rotate([90,0,0]){
cylinder(d=screw_hole_d+2*tol,h=servo_h);
}//end rotate
    
}//end translate

translate([-servo_l/2-wall_t,-((servos_n/2)*servo_w)/2,0]){
rotate([90,0,0]){
cylinder(d=screw_hole_d+2*tol,h=80);
}// end rotate
    
}// end translate
translate([0,-((servos_n+1)*servo_w)/2,0]){
cube([2*servo_l+2*tol,0.1,2*servo_h],center=true);
}// end translate




}// end difference
    }// end module servos_mount





difference(){
 translate([0,((servos_n+1)*servo_w+2*wall_t)/2,0]){  
servos_mount();
 }//end translate
 screw_pegs();
 

}//END DIFFERENCE
translate([10,25,-30]){
rotate([0,90,0]){
tube_holder();
}//end rotate
}//end translate
//servo_coupler();
screw_pegs();
