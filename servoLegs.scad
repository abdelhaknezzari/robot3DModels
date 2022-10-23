sevoLength=23;
servoWidth= 13.38;
servoHeight= 17.5;
ServoAttachDistW = 4;
ServoAttachDistL = 10;
ServoAttachHolDia = 1.5;
ServoAttachThick = 3;
ServoBoxThick=ServoAttachThick;
servoElCWidth = 3;
servoElCLength = 8;
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
    
//servoBoxTige();
 
servoHeadLength=18;
servoHeadWidth =7;
servoHeadEndDiam =4;
servoHeadMidleLength=6;
servoHeadNrHolesHor= 13;
servoHeadNrHolesVer= 5;  
  
legDiameter = 5;    
legLength = 50;
 
    
module servoHead() {
            module head() {
                difference() {
                   hull() {
                         union() {
                            square(servoHeadMidleLength,$fn=150,center=true);
                            translate([servoHeadLength,0,0]) circle(d=servoHeadEndDiam,$fn=150);   
                          }
                        };
                      circle(d=2.3,$fn=150);
                      for(ii =[1:servoHeadNrHolesHor/2]) {
                         translate([ii*2,0,0]) circle(d=1.5,$fn=150);
                      }
                    }
                }            
                module headSmall() {
                 difference() {  
                   hull() {
                       union() {
                         square(servoHeadMidleLength,$fn=150,center=true);
                         translate([servoHeadWidth,0,0]) circle(d=servoHeadEndDiam,$fn=150);       
                       }
                    };
                  circle(d=2.3,$fn=150);
                   for(ii =[1:servoHeadMidleLength/2 ]) {
                         translate([ii*2,0,0]) circle(d=1.5,$fn=150);
                      }
                }
            }
             
        linear_extrude(1.5) {
            rotate([0,0,90]) headSmall();
            rotate([0,0,-90]) headSmall();
            head();
            rotate([0,0,180]) head();            
            
            }    

}        
    

module leg() {
  servoHead();
  translate([servoHeadLength+legDiameter*0.5-servoHeadEndDiam*0.5,legLength*0.5,1]) 
    rotate([90,0,0])
       union() { 
       cylinder(legLength,legDiameter,legDiameter,$fn=150,center=true);
        }
             # translate([0,0,15]) sphere(d=10,$fn=150);
    
}    
    
leg();    
