roueWidth = 5;
roueDiameter = 40;
roueProfondeurL = 4;
roueDiamTroue = 1.55;
roueLateralThick = 3;



jointLargeur = 15;
jointLongeur = 28;

module  joint()
{
linear_extrude(3)
difference() {
    square([jointLargeur,jointLongeur],center=true);
    translate([0,9,0]) circle(roueDiamTroue*2,$fn=150);   
    translate([0,-9,0]) circle(roueDiamTroue*2,$fn=150);     
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


//joints();


module triangle()
    {
    rotate([0,90,0])
    
linear_extrude(4)
      difference()
        {       
         polygon([[0,70],[0,-70],[70,0]]);
         translate([55,0,0]) circle(roueDiamTroue, $fn=150);
         translate([10,50,0]) circle(roueDiamTroue, $fn=150);  
         translate([10,-50,0]) circle(roueDiamTroue, $fn=150);     
        }
    
    }
    
    
module chassis()

{
   
    
  translate([-34,0,0])  triangle();
  translate([30,0,0]) triangle();
  cube([70,140,4], center =true);
        
}

///chassis();


triangle();
translate([50,0,0]) triangle();

module roue()
{
rotate_extrude(angle = 360,convexity = 20,$fn=300)
    translate([(roueDiameter/4)+ roueDiamTroue *0.5 ,0,0])    
        rotate([0,0,-90])
            difference(){
            square([roueWidth,roueDiameter*0.5],center = true);
            translate([0,roueDiameter*0.5 - roueProfondeurL ,0]) 
                square([roueWidth-roueLateralThick,roueDiameter*0.5],center = true);
    }
}

//roue();





