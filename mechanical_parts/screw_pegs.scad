servo_l = 40.5;
servo_w = 20;
servo_h = 30;//37.5;
wing_h=10;
wing_l=6.74;
wing_offset = 1.75;
tol = 0.2;
wall_t = 5;

screw_hole_d=3.2;//3.87
inter_screws_dist = 6.2;
screws_x_offset = 4;
screws_y_offset = 8;
servos_n = 5;

servo_shaft_d = 5.8;
servo_shaft_l = 3.2;

tube_d = 4;


$fn=30;

module screws_holes(){
    cylinder(d=screw_hole_d+2*tol,h=20,center=true);
    translate([0,inter_screws_dist+screw_hole_d,0]){
        cylinder(d=screw_hole_d+2*tol,h=20,center=true);
        }//end translate
    }//end module

module screw_pegs(){
for (a =[0:servos_n]){
    translate([-(servo_l/2+screw_hole_d/2+wing_offset),a*servo_w+wall_t+screw_hole_d,-servo_h/2+wall_t])
    screws_holes();
    translate([servo_l/2+screw_hole_d/2+wing_offset,a*servo_w+wall_t+screw_hole_d,-servo_h/2+wall_t])
screws_holes();
}//end for


}//end module