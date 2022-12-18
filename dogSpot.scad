
factor=10;
ang=60;
curvature = 1;

servoLength=4.2; 
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

e1=3;
c1 = [factor*j[0]+e1,factor*j[1]-e1];
c2 = [factor*j1[0]+e1,factor*j1[1]+e1+3.5];
c3 = [factor*i1[0]-e1,factor*i1[1]+e1+3.5];
c4 = [factor*i[0]-e1,factor*i[1]-e1];

l = 1.3*sqrt( ((a+b)[0])^2+((a+b)[1])^2 ) / 2 ;
echo(l);

theta= atan(2*l/sqrt( ((a+b)[0])^2+((a+b)[1])^2 ));
c5 =factor*( a  + b ) / 2+ l * [1,-sin(theta)];


function extOffset(p=3) = p* [
 [-0.5,-1.],
 [1,1],
 [1,1],
 [-1,1],
 [-1,1],
 [1,1], 
 [1,-1],
 [-1,-1], 
 [-1,-1],
 [1,-1],
 [1,-1],
];

function legPolygon() = 
factor *[
a,
b,
c,
e,
f,
g, 
h,
i, 
i1,
j1,
j
];

function legEdges(p=3)= legPolygon() - extOffset(p);


radius = 15.5;
angles = [55-180, 60];
width = 3;
fn = 124;

module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = r* concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [cos(a), sin(a)]
        ],
        r*[[ cos(angles[1]), sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = 24) {
    difference() {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
} 




union() {
    difference() {
        offset(r = curvature,chamfer= true,$fn=150) 
          union() {
             polygon( legPolygon());
             translate(factor*co) 
             difference() {circle(d=diam*factor,$fn=100); 
                 rotate([0,0,ang]) 
                translate([0,factor*diam*0.25,0]) 
                 square(factor*diam*[1,1/2],center=true); }
             
            }
         
         # offset(r = curvature,chamfer= true,$fn=150) polygon( factor*[d2,d3,d1]);
          translate(c1) circle(2,$fn=150);
         # translate(c2) circle(2,$fn=150);
         # translate(c3) circle(2,$fn=150);
          translate(c4) circle(2,$fn=150);
          translate(c5) circle(2,$fn=150);  
          

      
        
    } ;
    
 lolo = legEdges(4);
 lolo2 = legEdges(1.7);
    
# translate(lolo2[0]) circle(0.2,$fn=150); 
   
#  translate(factor*co) linear_extrude(1) arc(radius, angles, width);
    
difference() {
  # offset(r = 0.3,chamfer= true,$fn=150) 
    polygon(legEdges(4));
    offset(r = 0.3,chamfer= true,$fn=150)
    polygon(legEdges(1.7));
    
    }    

    
//  # polygon( factor* [b,b-[0,0.3],c-[0,0.3],c]);
//  # polygon( factor* [c,c-[0,0.3],e-[0,0.3],e]);
// # polygon( factor* [e,e-[0,0.3],f-[0,0.3],f]);
//  # polygon( factor* [f,f-[0,0.3],g-[0,0.3],g]);
//  # polygon( factor* [j,j+[0,0.3],a+[0,0.3],a]);
//  # polygon( factor* [i1,i1+[0,0.3],j1+[0,0.3],j1]);
//   # polygon( factor* [j1,j1-[0.3,0],j-[0.3,0],j]);
//   # polygon( factor* [i1,i1+[0.3,0],i+[0.3,0],i]);  
//     # polygon( factor* [g,g-[0.3,0],h-[0.3,0],h]);    
//      # polygon( factor* [h,h+[0,0.3],i+[0,0.3],i]);
    
    }






