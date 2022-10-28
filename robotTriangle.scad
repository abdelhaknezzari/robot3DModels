roueWidth = 5;
roueDiameter = 40;
roueProfondeurL = 4;
roueDiamTroue = 1.55;
roueLateralThick = 3;

jointLargeur = 7;
jointLongeur = 17;
jointHoleEdge=4;

chassisThick = 3;

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


triangleLength = 60;
trinagleHoleEdgeL = triangleLength/8;

module triangle()
    {
      translate([-chassisThick*0.5,0,0])
      rotate([0,90,0])
      linear_extrude(chassisThick)
      difference()
        {       
         polygon([[0,triangleLength],[0,-triangleLength],[triangleLength,0]]);
         translate([triangleLength*0.5+trinagleHoleEdgeL*2,0,0]) circle(roueDiamTroue, $fn=150);
         translate([trinagleHoleEdgeL,triangleLength*0.5+trinagleHoleEdgeL,0]) circle(roueDiamTroue, $fn=150);  
         translate([trinagleHoleEdgeL,-triangleLength*0.5-trinagleHoleEdgeL,0]) circle(roueDiamTroue, $fn=150);     
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
    
module chassis()
{   
  translate([-triangleLength*0.5+chassisThick*0.5,0,-chassisThick*0.5]) triangle();
  translate([triangleLength*0.5 - chassisThick*0.5 ,0,-chassisThick*0.5]) triangle();
  cube([triangleLength,triangleLength*2,chassisThick], center =true);
        
}

difference() {
square(4,center=true);
translate([2,2,0]) circle(4,$fn=150);    
    }



//chassis();



//triangle();

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

    //translate([-50,0,0])  triangle();
    //translate([50,0,0]) triangle();
    translate([0,0,-47]) rotate([90,0,90]) color("#aa6800") roue();
 }
 
// assembledRobot();
