sevoLength=23;
servoWidth= 13.38;
servoHeight= 17.5;
ServoAttachDistW = 4;
ServoAttachDistL = 10;
ServoAttachHolDia = 1.5;
ServoAttachThick = 3;
ServoBoxThick=ServoAttachThick;
servoElCWidth = 2;
servoElCLength = 6;
tigeLength=40;
tigeWidth=10;
tigeThick=ServoAttachThick;


ServoAttachBaseDistL = 15;


    module cadre() {
       linear_extrude(ServoAttachThick)
           difference() {
            square([sevoLength+ServoAttachDistL,servoWidth+ServoBoxThick],center = true);            
            square([sevoLength,servoWidth],center = true);   
            translate([sevoLength*0.5 + ServoAttachDistL*0.250,0]) circle(ServoAttachHolDia,$fn=150);
            translate([-sevoLength*0.5 - ServoAttachDistL*0.250,0]) circle(ServoAttachHolDia,$fn=150);        
           }
        }
     
      module box() {
        translate([0,0,servoHeight*0.5+ServoAttachThick]) 
           difference() {
                cube([sevoLength+ServoBoxThick,servoWidth+ServoBoxThick,servoHeight],center=true);
                translate([0,0,-ServoBoxThick]) cube([sevoLength,servoWidth,servoHeight],center=true);
                rotate([0,0,90]) translate([0,sevoLength*0.5-servoElCWidth*0.5,ServoBoxThick+ServoBoxThick+servoElCLength*0.25])  
                   cube([servoElCLength,servoElCWidth,5],center=true);
               }
          }

module servoBoxTige() {         
      module tige() {
          translate([0,0,tigeLength*0.5])
            linear_extrude(tigeLength)
               difference() {
                 circle( tigeWidth*0.5,$fn=150 );    
                 circle( (tigeWidth-tigeThick)*0.5,$fn=150 ); 
              
              }
    
      }
    
    cadre();
    box();
    tige();
    
    }
    
module servoBoxFix() {
         
      module attach() {
          translate([0,0,tigeLength*0.5])
             linear_extrude(ServoAttachThick)
              difference() {
                  square([sevoLength+ServoAttachBaseDistL,servoWidth+ServoBoxThick],center=true);
                  translate([sevoLength*0.5 + ServoAttachDistL*0.5,0]) circle(ServoAttachHolDia,$fn=150);
                  translate([-sevoLength*0.5 - ServoAttachDistL*0.5,0]) circle(ServoAttachHolDia,$fn=150);
           }

    
      }
    
    cadre();
    box();
    attach();
    
    }    
    
//servoBoxFix();
    
servoBoxTige();