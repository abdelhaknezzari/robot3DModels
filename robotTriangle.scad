roueWidth = 5;
roueDiameter = 40;
roueProfondeurL = 4;
roueDiamTroue = 1.55;
roueLateralThick = 3;

jointLargeur = 7;
jointLongeur = 17;
jointHoleEdge=4;

chassisThick = 3;

triangleLength = 60;
trinagleHoleEdgeL = triangleLength/8;

module  joint()
{
    color("#065535")
    linear_extrude(chassisThick)
    difference() {
        square([jointLargeur,jointLongeur],center=true);
        translate([0,jointLongeur*0.5 -jointHoleEdge,0]) circle(roueDiamTroue,$fn=150);   
        translate([0,-jointLongeur*0.5+jointHoleEdge,0]) circle(roueDiamTroue,$fn=150);     
     }
}

module joints()
{
    joint();
    translate([0,40,0]) joint();
    translate([30,40,0]) joint();
    translate([40,0,0]) joint();
    translate([60,40,0]) joint();
    translate([70,0,0]) joint();
}


 //joint();

//joints();

module renforcement()
translate([triangleLength*0.5-0.5,triangleLength,-2])
{  
     color("#1009d0")
    difference(){
         rotate([90,0,0]) linear_extrude(triangleLength*2)
           polygon([[0,0],[0,chassisThick+1],[chassisThick+1,0]]);
        # translate([0,-2*triangleLength-4.25,0]) rotate([-45,0,0]) cube([10,6,35],center = true);
        #translate([0,+4.25,0]) rotate([45,0,0]) cube([10,6,35],center = true);      
    }
}

//renforcement();


//        translate([0.5*triangleLength-2,0,-2]) rotate([0,180,0])
//        renforcement();




module triangle()
    {
     union() {
          translate([-chassisThick*0.5,0,0])
          rotate([0,90,0])
          linear_extrude(chassisThick)
          difference()
            {       
             polygon([[0,triangleLength],[0,-triangleLength],[triangleLength,0]]);
             translate([triangleLength*0.5+trinagleHoleEdgeL*2,0,0]) circle(roueDiamTroue, $fn=150);
             translate([trinagleHoleEdgeL,triangleLength*0.5+trinagleHoleEdgeL,0]) circle(roueDiamTroue, $fn=150);  
             translate([trinagleHoleEdgeL,-triangleLength*0.5-trinagleHoleEdgeL,0]) circle(roueDiamTroue, $fn=150);     
            };
        translate([0.5*triangleLength-2,0,-2]) rotate([0,180,0])
        renforcement();
                 
         
         }   

    
}
    

//triangle();  

module roue()
{
   rotate_extrude(angle = 360,convexity = 20,$fn=300)
    translate([(roueDiameter/4)+ roueDiamTroue *0.5+roueDiamTroue-0.55 ,17,0])    
        rotate([0,0,-90])
            difference(){
            square([roueWidth,roueDiameter*0.5],center = true);
            translate([0,roueDiameter*0.5 - roueProfondeurL ,0]) 
                square([roueWidth-roueLateralThick,roueDiameter*0.5],center = true);
    }
}


//roue();

module renforcement1() {
        #translate([-0,-triangleLength,-chassisThick]) rotate([-90,0,0]) linear_extrude(2*triangleLength)
    difference() {
        square(chassisThick,center=true);
        translate([2,2,0]) circle(chassisThick,$fn=150); 
     
     translate([-2,-2,0])circle(chassisThick,$fn=150);  
    }
}

    
module chassis()
{   

    union() {    
          translate([-triangleLength*0.5+chassisThick*0.5,0,-chassisThick*0.5]) rotate([0,0,180])  triangle();
          translate([triangleLength*0.5 - chassisThick*0.5 ,0,-chassisThick*0.5]) triangle();
          cube([triangleLength,triangleLength*2,chassisThick], center =true);  
    }       
}


chassis();


module assembledRobot() {
    chassis();
    translate([-37,0,-42]) rotate([90,0,90])  joint();
    translate([37,0,-42]) rotate([90,0,90])  joint();
    translate([-37,38,-4]) rotate([90,0,90])  joint();
    translate([37,38,-4]) rotate([90,0,90])  joint();
    translate([37,-38,-4]) rotate([90,0,90])  joint();
    translate([-37,-38,-4]) rotate([90,0,90])  joint();

    translate([1,0,-46.5]) rotate([90,0,90]) color("#09bfb8") cylinder(82,1.5,1.5 ,center = true, $fn = 150);
    translate([1,38,-9]) rotate([90,0,90]) color("#09bfb8") cylinder(82,1.5,1.5 ,center = true, $fn = 150);
    translate([1,-38,-9]) rotate([90,0,90]) color("#09bfb8") cylinder(82,1.5,1.5 ,center = true, $fn = 150);

   // translate([-50,0,0])  triangle();
//    translate([50,0,0]) triangle();
    translate([0,0,-47]) rotate([90,0,90]) color("#aa6800") roue();
 }


//triangle();


// assembledRobot();
 


module robotAvecRenforcement() {
        color("#236dc9")
        chassis();
        translate([-0.5*triangleLength+2,0,-2]) rotate([0,+180-90,0])
        renforcement();
        translate([0.5*triangleLength-2,0,-2]) rotate([0,180,0])
        renforcement();
}
//robotAvecRenforcement();


//rotate_extrude(angle = 360,convexity = 20,$fn=300)
//   translate([(roueDiameter/4)+ roueDiamTroue *0.5+roueDiamTroue-0.55 ,0,0])    
//       rotate([0,0,-90])
//            difference(){
//            square([roueWidth,roueDiameter*0.5],center = true);
//            translate([0,roueDiameter*0.5 - roueProfondeurL ,0]) 
//                square([roueWidth-roueLateralThick,roueDiameter*0.5],center = true);
//           }
                
                
