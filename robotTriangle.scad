module  piece1()
{
linear_extrude(3)
difference() {
    square([15,28],center=true);
    translate([0,9,0]) circle(2,$fn=150);   
    translate([0,-9,0]) circle(2,$fn=150);     
    }
}





module joints()
{
piece1();
translate([0,40,0]) piece1();
translate([30,40,0]) piece1();
translate([40,0,0]) piece1();
translate([60,40,0]) piece1();
translate([70,0,0]) piece1();
}


//joints();

module chassis()

{
module triangle()
    {
    rotate([0,90,0])
    
linear_extrude(4)
      difference()
        {       
         polygon([[0,70],[0,-70],[70,0]]);
         translate([55,0,0]) circle(3, $fn=150);
         translate([10,50,0]) circle(3, $fn=150);  
         translate([10,-50,0]) circle(3, $fn=150);     
        }
    
    }
    
    
  translate([-34,0,0])  triangle();
  translate([30,0,0]) triangle();
  cube([70,140,4], center =true);
        
}

//chassis();


module roue()

{

rotate_extrude(angle = 360,convexity = 20,$fn=150)
  
translate([20,0,0])    
    rotate([0,0,-90])
difference(){
square([5,30],center = true);
translate([0,14,0]) square([3,3],center = true);
}


}

//roue();