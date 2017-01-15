module flake(branches=[],circr=30,r=3,ang=45){
    samples = len(branches);
    offset = 2.0 / samples;
    increment = PI * (3.0 - sqrt(5));
    union(){
        for (i = [0:samples-1]){
            y = ((i * offset ) - 1) + (offset / 2.0);
            rr = sqrt(1 - pow(y,2));
            phi = ((i) % samples ) * increment ;
            x = cos(phi*180/PI) * rr;
            z = sin(phi*180/PI) * rr;
            rotate([0,0,atan2(y,x)])rotate([0,atan2(sqrt(pow(x,2)+pow(        y,2)),z),0])small_one(circr,r,ang,branches[i]);  
        }
    }
}
module big_one(d,r){
    union(){
        cylinder(d-r,r,r,$fn=30);
        translate([0,0,d-r])sphere(r,$fn=30);
    }
}
module small_one(d,r,angle,number){
    if(number ==1){
        big_one(d,r);
    }
    else {
        x=sqrt(pow((d-r),2)/(13-12*cos(180-angle)));
        big_one(3*x+r,r);
        angle2=0;
        increment = 360/number; 
        for (i = [1:number]){
            translate([0,0,3*x])rotate([0,0,increment*i]) rotate([        angle,0,0])big_one(2*x,r);      
        }
    }
}




  



