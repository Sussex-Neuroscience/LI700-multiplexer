servo_l = 40.5;
servo_w = 20;
servo_h = 37.5;
wing_h=10;
wing_l=6.74;
wing_offset = 1.75;
tol = 0.2;
wall_t = 5;

screw_hole_d=3.87;
inter_screws_dist = 6.2;
screws_x_offset = 4;
screws_y_offset = 8;
servos_n = 4;


$fn=30;



module servos_holder(){



difference(){

union(){    
cube([servo_l+2*wall_t,servo_w+2*wall_t,servo_h-wing_h],center=true);

translate([0,0,servo_h/2-wing_h/2]){
cube([servo_l+2*wall_t+2*wing_l,servo_w+2*wall_t,wall_t],center=true);
}//end translate
}//end union
translate([0,0,wall_t]){
cube([servo_l+2*tol,servo_w+2*tol,servo_h-wing_h+2*tol],center=true);
}

//translate([0,0,servo_h/2-wing_h+2*wall_t+0.5]){
//%cube([servo_l+20,servo_w,wall_t+1],center=true);
//}//end translate
//end translate

translate([20,0,wall_t+10-tol])
cube([30,7.3,servo_h+10],center=true);

}//end difference
}//end module



module screws_holes(){
    cylinder(d=screw_hole_d+2*tol,h=20,center=true);
    translate([0,inter_screws_dist+screw_hole_d,0]){
        cylinder(d=screw_hole_d+2*tol,h=20,center=true);
        }//end translate
    }//end module

//servos_holder();
//    translate([-(wall_t+servo_l/2+screw_hole_d/2+wing_offset),-(inter_screws_dist+screw_hole_d)/2,0])
//screws_holes();

module servos_mount(){
difference(){
cube([servo_l+2*tol+20,(servos_n+1)*servo_w+2*wall_t,40],center=true);
    //cube([servo_l+2*tol+20,servos_n*servo_w+2*wall_t,10]);
translate([0,0,])
cube([servo_l+2*tol,(servos_n+1)*servo_w,45],center=true);    
translate([0,0,wall_t])
cube([servo_l+2*tol,(servos_n+1)*servo_w+3*wall_t,40],center=true);
translate([0,wall_t,wall_t])
cube([2*servo_l+2*tol-wall_t,(servos_n+1)*servo_w-2*wall_t,40],center=true);
}
    }

difference(){
 translate([0,((servos_n+1)*servo_w+2*wall_t)/2,0]){  
servos_mount();
 }//end translate
for (a =[0:servos_n]){
    translate([-(servo_l/2+screw_hole_d/2+wing_offset),a*servo_w+wall_t+screw_hole_d,-40/2+wall_t])
    screws_holes();
    translate([servo_l/2+screw_hole_d/2+wing_offset,a*servo_w+wall_t+screw_hole_d,-40/2+wall_t])
screws_holes();
}//end for

translate([servo_l/2+wall_t,20,0]){
rotate([90,0,0]){
cylinder(d=3,h=40);
}
    
}

translate([-servo_l/2-wall_t,20,0]){
rotate([90,0,0]){
cylinder(d=3,h=40);
}
    
}

}//END DIFFERENCE
