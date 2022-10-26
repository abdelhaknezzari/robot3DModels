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
       translate([servoHeadLength+0.5,legLength,1]) sphere(d=10,$fn=150);
    
}    
    
//leg();    


BaseLength = 200;
BaseWidth  = 150;
BaseThick = 2.5;
axeDiam = 7.2;
axeEdgePlus = 25;

module chassis() {
      module axe() {
            difference() {
                cylinder(BaseWidth+axeEdgePlus*2,axeDiam,axeDiam,center=true,$fn=150);
                }
          
          }
      
    
      cube([BaseWidth,BaseLength,BaseThick],center=true);
      translate([0,BaseLength*0.5 - axeDiam- axeEdgePlus,axeDiam+BaseThick*0.5]) 
          rotate([0,90,0])  
          color("#32a875") 
          axe();
      translate([0,-BaseLength*0.5 + axeDiam +axeEdgePlus,axeDiam+BaseThick*0.5]) 
          rotate([0,90,0])  
          color("#32a875") 
          axe();
       
    translate([0,0,BaseThick+2*axeDiam])  cube([BaseWidth,BaseLength,BaseThick],center=true);

    
    
    }
    
    
module chassisWithServoSupport() {
    chassis();
    translate([BaseWidth*0.5+ servoHeight +axeEdgePlus+ServoBoxThick+1 ,BaseLength*0.5-axeEdgePlus-axeDiam,axeDiam+BaseThick*0.5]) 
    rotate([-90,0,90])
    servoBoxTige();
    
    translate([BaseWidth*0.5+ servoHeight +axeEdgePlus+ServoBoxThick+1 ,-BaseLength*0.5+axeEdgePlus+axeDiam,axeDiam+BaseThick*0.5]) 
    rotate([-90,0,90])
    servoBoxTige();
    
    translate([-BaseWidth*0.5- servoHeight -axeEdgePlus-ServoBoxThick-1 ,-BaseLength*0.5+axeEdgePlus+axeDiam,axeDiam+BaseThick*0.5]) 
    rotate([90,0,90])
    servoBoxTige();
    
    translate([-BaseWidth*0.5- servoHeight -axeEdgePlus-ServoBoxThick-1 ,BaseLength*0.5-axeEdgePlus-axeDiam,axeDiam+BaseThick*0.5]) 
    rotate([90,0,90])
    servoBoxTige();

}    

//chassisWithServoSupport();

lineFolIntLength=66;
lineFolIntWidth=17;
lineFolIntEdgeWidth=10;
lineFolBridgeH = 9;
lineFolBridgeW = 4;

module infraredLineFollower() {
    
    module cadre() {
        difference() { 
             cube([lineFolIntWidth+lineFolIntEdgeWidth,lineFolIntLength+lineFolIntEdgeWidth,2],center=true);
             cube([lineFolIntWidth,lineFolIntLength,2+1],center=true);           
            }
        }
     module bridge() {
         
         module pilar(length=0,width=0,height=0) {
               hull(){
                translate([0,-lineFolBridgeW,0]) 
                cylinder(lineFolBridgeH,lineFolIntEdgeWidth*0.25,lineFolIntEdgeWidth*0.25,center=true,$fn=150);
                translate([0,lineFolBridgeW,0]) 
                cylinder(lineFolBridgeH,lineFolIntEdgeWidth*0.25,lineFolIntEdgeWidth*0.25,center=true,$fn=150);
                 }
             }
             
             translate([lineFolIntWidth-6,0,4.5]) pilar();
             translate([-lineFolIntWidth+6,0,4.5]) pilar();
         
         }
        
        
     cadre();  
     bridge(); 
    
    }
    
infraredLineFollower();
