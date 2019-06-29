module ledarray() {
    for(r =[0:4]) {
        for(c =[0:4]) {
            translate([r*4,c*4,0]) cube([3,3,6]);
        }
    }
}

module pins() {
    for(i =[0:6]) {
        rotate([0,0,i*360/6])translate([0,41,0]) cylinder(d=12, h=12, $fn=30);
        rotate([0,0,i*360/6])translate([0,47,6]) cube([12,12,12], center=true);
    }
}

module topcase(diameter=100.5, height=12) {
    difference() {
        cylinder(d=diameter, h=height, $fn=6);
        translate([0,0,2])
        cylinder(d=diameter-5, h=height, $fn=6);
        translate([-9.5,0.5,0]) ledarray();
        rotate([0,0,30]) pins();
        translate([-22.5,16,1.5]) rotate([0,0,-27]) {
            cube([7,13,3], center=true); //connector A0
            translate([2,0,0]) cube([7,6,3], center=true); //connector A0
        }
        translate([22.5,16,1.5]) rotate([0,0,27]) { 
            cube([7,13,3], center=true); //connector A1
            translate([-2,0,0]) cube([7,6,3], center=true); //connector A1
        }
        translate([28.5,5.5,0]) cylinder(d=6, h=3, $fn=30); // Button A
// Button A
        translate([-28.5,5.5,0]) cylinder(d=6, h=3, $fn=30);  // Button B
// Button B
        translate([-8,28,0]) cylinder(d=6, h=3, $fn=30);  // Reset Button 
        translate([0,38,0]) cylinder(d=12, h=12, $fn=30); // USB
        translate([0,44,6]) cube([12,12,12], center=true); // USB
        translate([0,-8,0]) cylinder(d=4, h=3, $fn=30);  // RGB LED
        translate([0,-25,1.5]) cube([34,6,3], center=true);  // Connector
        translate([0,-20,1.5]) cube([15,6,3], center=true);  // motor Connector
        translate([-33,-19,7]) cube([8,8,10], center=true);
        
    }
    translate([24,-19,4.75]) cube([8,8,5.5], center=true);
    translate([0,28,4]) cube([8,8,4], center=true); //USB
    translate([0,-8,2]) difference() {  // RGB LED
        cylinder(d=8, h=4, $fn=30); 
        cylinder(d=4, h=4, $fn=30);  
    }
    translate([-10.5,-0.5,2]) difference() { // led array
        cube([21,21,4]);
        translate([1,1,0])ledarray();
    }
}

module bottomcase(diameter=95) {
    difference(){
        cylinder(d=diameter, h=18, $fn=6);
        translate([0,0,2]) cylinder(d=diameter-5, h=18, $fn=6);
        translate([0,-25,1.5]) cube([34,6,3], center=true);  // Connector
        translate([0,-20,1.5]) cube([15,6,3], center=true);  // motor Connector
        translate([0,43,15]) cube([12,12,10], center=true); // USB
    }
    translate([19,16,2]) cylinder(d=6, h=15, $fn=30);
    translate([19,-16,2]) cylinder(d=6, h=15, $fn=30);
    translate([-19,16,2]) cylinder(d=6, h=15, $fn=30);
    translate([-19,-16,2]) cylinder(d=6, h=15, $fn=30);
}

module button(socket=1) {
    cylinder(d=8, h=socket, $fn=30);
    translate([0,0,socket]) cylinder(d=5, h=2, $fn=30);
    translate([0,0,socket+2]) sphere(d=5, $fn=30);
}
        

ledarray();
pins();
topcase();
!topcase(diameter=89.5, height=11);
bottomcase();
button();
button(3);


