servo_l = 30;
servo_w = 20;
servo_h = 25;


tol = 0.1;
wall_t = 2;


%cube([servo_l+2*wall_t,servo_w+2*wall_t,servo_h-4],center=true);

translate([0,0,servo_h/2-2.5+wall_t]){
cube([servo_l+20,servo_w+2*wall_t,3],center=true);
}//end translate

translate([0,0,wall_t+5]){
cube([servo_l+2*tol,servo_w+2*tol,servo_h+2*tol],center=true);


translate([0,0,8]){
cube([servo_l+20,servo_w,3],center=true);
}//end translate
}//end translate