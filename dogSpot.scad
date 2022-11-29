

factor=10;
ang=60;
curvature = 1;

servoLength=4.1; 
servoWidth=2; 
diam=2.74591;

a = [5,0];
b = [(a[0]-diam*cos(ang)),(a[1]-diam*sin(ang))] ;
c = [2.7,-1.1];
e=[-2,-1.1];
f = [-3,-2.8];
g=[-8.7,-2.8];
h=[-8.7,0];

i=[-3.5-servoLength-curvature/factor,0];
i1=[-3.5-servoLength-curvature/factor,-servoWidth];
j1=[-3.5+curvature/factor,-servoWidth];
j=[-3.5+curvature/factor,0];

co=[(a[0]+b[0])*0.5,(a[1]+b[1])*0.5 ];

d2 = [a[0] - diam *0.25* cos(ang),a[1]-diam *0.25* sin(ang)  ];
d3 = [b[0] + diam *0.25* cos(ang),b[1] + diam *0.25* sin(ang)  ];
d2d3 = sqrt( (d2[0]-d3[0] )^2  + (d2[1]-d3[1] )^2  );
d1= [d2[0]-d2d3,d2[1]];

difference() {
offset(r = curvature,chamfer= true,$fn=150) 
  union() {
     polygon( factor*[a,b,c,e,f,g,h,i,i1,j1,j]);
     translate(factor*co) 
     difference() {circle(d=diam*factor,$fn=100); 
         rotate([0,0,ang]) 
        translate([0,factor*diam*0.25,0]) 
         square(factor*diam*[1,1/2],center=true); }
     
    }
 
 offset(r = curvature,chamfer= true,$fn=150) polygon( factor*[d2,d3,d1]);
    
}
