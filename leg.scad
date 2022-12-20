
a= [0,-1];
move = function(point,trXY=[0,0],alpha=0) ([[cos(alpha),-sin(alpha)],[sin(alpha) ,cos(alpha)]] * point) + trXY;
b = move(a,[30,1],0);
c = move(b,[15,0],0);
d = move(c,[15,0],0);
e = move(d-c,[0,0],-60) + c;

f = (e+ c)*1/2 ;
g = move(f,[-20,0],0);
h = move(g,[-28.8,-1],0);

d1 = e*1/3 + d*2/3;
d2 = move(d1,[-6,0],0);;


//b=[-40,-3];
//c=[35,-3];
//d=[50,-20];
//
//
//e=[60,5];
//f=[40,5];
//g=[-40,5];
//h=[-70,3];
//
//d1 = (d+e)*1/2;
//d2 = (d+d1)*1/2;
//d3 = (d1+e)*1/2;
//d4 = (d1+d2)*1/2;
//d5= [40, 2]; //(d3+d4)*1.2/3;
//d6= (d3+e)*1/2;
//
//echo(d5);
//
//

#translate(a) circle(0.2,$fn=150); 
#color("DarkBlue") translate(b) circle(0.2,$fn=150); 
#color("DarkBlue") translate(c) circle(0.2,$fn=150); 
#color("DarkBlue") translate(d) circle(0.2,$fn=150); 
#color("DarkBlue") translate(e) circle(0.2,$fn=150); 
#color("DarkBlue") translate(f) circle(0.2,$fn=150); 
#color("DarkBlue") translate(g) circle(0.2,$fn=150); 
#color("DarkBlue") translate(h) circle(0.2,$fn=150); 
color("DarkBlue") translate(d1) circle(0.2,$fn=150); 
color("DarkBlue") translate(d2) circle(0.2,$fn=150); 
//#translate(d3) circle(0.2,$fn=150);
//#translate(d5) circle(0.2,$fn=150);
//#translate(d6) circle(0.2,$fn=150);
//#translate(e) circle(0.2,$fn=150);

f1 = function() [a,b,c,d,e,f,g,h];
//offset(r = 1,chamfer= true,$fn=150) polygon(f1());