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
          translate([0,0,tigeLength*0.5]) union() {
            linear_extrude(tigeLength)
               difference() {
                 circle( tigeWidth*0.5,$fn=150 );    
                 circle( (tigeWidth-tigeThick)*0.5,$fn=150 );
              };
              translate([-11.5,-6.5,-22]) color("#ac78f6") cube([23,13,10]);
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




lineFolIntLength=66;
lineFolIntWidth=17;
lineFolCadreThickInt = 2;
lineFolCadreThickExt = 4;


lineFolIntEdgeWidth=15;

pilarWidth = 7.5;
pilarHight = 10;
pilarLength = 10;

bridgeThick = 3;

module infraredLineFollower() {
    module cadre(length=0,width=0,edgeL=0,thick=0) {
        difference() { 
             cube([length + lineFolIntEdgeWidth,width+lineFolIntEdgeWidth,thick],center=true);
             cube([length ,width,thick+1],center=true);           
            }
        }        
    module cadres() {
         union() {
         translate([0,0,lineFolCadreThickInt]) 
             cadre(length=lineFolIntWidth,width=lineFolIntLength,thick=lineFolCadreThickInt);  
             cadre(
                  length=lineFolIntWidth+lineFolIntEdgeWidth,
                  width=lineFolIntLength+lineFolIntEdgeWidth,
                  thick=lineFolCadreThickInt+lineFolCadreThickExt); 
              }         
         }
    module pilar(width=0,height=0,length=0) {
               hull(){
                    translate([0,-length*0.5,0]) 
                     cylinder(height,width*0.5,width*0.5,center=true,$fn=150);
                    translate([0,length*0.5,0]) 
                     cylinder(height,width*0.5,width*0.5,center=true,$fn=150);
                 }
    }    
    module bridge() {
             trX = lineFolIntWidth*0.5+lineFolIntEdgeWidth*0.5+lineFolIntEdgeWidth/4;  
             trZ = -pilarHight+lineFolCadreThickExt*0.5;
             translate([0,0,trZ]) 
             union() {
                 translate([-trX,0,0])            
                     pilar(pilarWidth,pilarHight,pilarLength);
                 translate([trX,0,0]) 
                     pilar(pilarWidth,pilarHight,pilarLength);
                  translate([0,0,-3.5]) 
                     rotate([0,0,90])
                     cube([pilarLength+pilarWidth,2*trX,bridgeThick],center=true);
                 
                 #translate([0,0,-25]) 
                 difference() {
                         cylinder(40,8,8,$fn=150,center=true);
                         cylinder(41,5,5,$fn=150,center=true);
                       }
                 }     
         }
      cadres();   
      color("#ac28f6") bridge(); 
 }


//rotate([0,0,90]) 
//   union() 
//    { infraredLineFollower();
//       color("#9809") translate([-6.5,-32.5,0])  cube([12,65,5]);}
         

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

    translate([0,-90,48]) rotate([0,0,90]) infraredLineFollower();
    color("#9809") translate([32.5,-96,44]) rotate([0,0,90]) cube([12,65,5]);
    
}    

//chassisWithServoSupport();


wheelDiam = 69;
wheelLarge = 27;
tyreTick = 4;
wheelTigeLength=100;
wheelTigeDiam = 14;

module wheelMotor() {
    module wheel() {
      rotate([0,90,0]) cylinder(27,wheelDiam*0.5,wheelDiam*0.5,$fn=150,center=true);
    }

   module tyre() {
        rotate([-90,0,90])
        color("#aaaaaa")
        rotate_extrude(angle = 360,convexity = 20,$fn=300)
        translate([wheelDiam*0.5+1.5,0,0])
        rotate([180,0,90]) 
        difference() {
            square([wheelLarge,tyreTick],center=true);
            translate([0,2.5,0]) square([1,2],center=true);
             translate([-3,2,0]) square([2,2],center=true);
             translate([-6,2,0]) square([1,2],center=true);
             translate([-9,2,0]) square([2,2],center=true);
             translate([-12,2,0]) square([1,2],center=true);
             translate([3,2,0]) square([2,2],center=true);
             translate([6,2,0]) square([1,2],center=true);
             translate([9,2,0]) square([2,2],center=true);
             translate([12,2.5,0]) square([1,2],center=true);
         }  
       }
       
    module axe() {
       #color("#acb121") translate([5,0,0]) rotate([0,90,0]) cylinder( 40, 2,2,$fn=150,center=true);
        }
    module motor() {
          
        
        
        }
        
  module motorCage() {
       color("#faf999") union() {
         translate([58,0,6]) cube([80,80,40],center = true);
   
            translate([58,-59,6]) rotate([90,0,0]) 
                 difference() {
             cylinder(40,25,25,$fn=150,center=true);
             translate([-25,0,0])  rotate([0,-0,90]) cube([45,10,45],center=true); 
             translate([25,0,0])  rotate([0,-0,90]) cube([45,10,45],center=true); 
            }

         
        }
      }
      
      
  module support() {
      translate([18.5,-75,12]) 
      rotate([0,-90,-90])
      union() {
      linear_extrude(30)
      difference() {
        square([40,40],center= true);
        translate([-ServoBoxThick,-ServoBoxThick,0]) square([40,40],center= true);          
          };


          translate([40+25,0,15]) rotate([90,0,90]) 
          difference() {
                   cylinder(wheelTigeLength,wheelTigeDiam,wheelTigeDiam,center=true, $fn=150);   
                   cylinder(wheelTigeLength+1,wheelTigeDiam-ServoBoxThick,wheelTigeDiam-ServoBoxThick,center=true, $fn=150); 
              }  
       
          
          
          }


      
      }  
       
      wheel();
     tyre();
      axe();
     motorCage();
      support();
     // motor();
      

 }


    
translate([-150,0,-150]) wheelMotor();

    

 
 
