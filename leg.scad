
move = function(point,trXY=[0,0],alpha=0) 
     ([[cos(alpha),-sin(alpha)],[sin(alpha) ,cos(alpha)]] * point) + trXY;
turn = function(point,r,alpha=0) move( move(point,[r,0],0) -point, [0,0] ,alpha) +point;

module showPath(p) {
    for(a =[0:1:len(p)-1]) color("DarkBlue") translate( p[a]) circle(0.2,$fn=150); 
}

arcBtween = function(p1,p2) [for(a =[0:180]) 
    (p1+p2)*0.5 + sqrt((p1[0]-p2[0] )^2 +( p1[1]- p2[1])^2)*0.5* 
    [cos(a-atan( abs(p1[1]-p2[1] ) / abs( p1[0]-p2[0]) )),-sin(a-atan( abs(p1[1]-p2[1] ) / abs( p1[0]-p2[0]) ))] ];




a= [0,-1];
a2 = turn(a,2,180);
b = move(a,[30,1],0);
c = move(b,[15,0],0);
d = move(c,[20,0],0);
e = move(d-c,[0,0],-60) + c;
d1 = e*1/3 + d*2/3;
d2 = move(d1,[-7,0],0);
d3 = e*2/3 + d*1/3;
f = (e+ c)*1/2;
g  = move(f,[-10,2],0);
h = move(g,[-20,0],0);
i = move(h,[-20,-2],0);

ap = move(a, [-2,2] ,0 );
bp = move(b, [0,2] ,0 );
cp = move(c, [0,2] ,0 );
dp = move(d, [2,2] ,0 );
ep =  turn(dp,25,60-180) ; //move(move(dp, [25,0] ,0 )-dp, [0,0] ,60-180)+dp;
dp1 = turn(dp,2,60-180) ;//move( move(dp,[2,0],0) - dp, [0,0] ,60-90) + dp ;
dp2 = turn(dp1,2,-105) ;// move( move(dp1,[2,0],0) -dp1, [0,0] ,-105) +dp1 ;

ep1 = turn(ep,2,60-90);//move( move(ep,[2,0],0) - ep, [0,0] ,60-90) + ep ;
ep2 = turn(ep1,2,70);;//move( move(ep1,[2,0],0) -ep1, [0,0] ,70) +ep1 ; 
fp =  move(f, [-2,-2] ,0 );
gp =  move(g, [0,-2] ,0 );
hp =  move(h, [0,-2] ,0 );
ip =  move(i, [-2,-2] ,0 );

j = turn(ip,5,-90);
k = turn(j,30,180);
l = turn(k,17,90);
m = turn(l,4,0);
n = turn(m,13,-90);
o = turn(n,22,0);
p = turn(o,13,90);
q = turn(p,4,0);

module showPoints() {
    #translate(ap) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(bp) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(cp) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(dp) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(ep) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(dp1) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(dp2) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(ep1) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(ep2) circle(0.2,$fn=150); 
    vv = arcBtween(dp2,ep2);
    #for(a =[0:10:180]) color("DarkBlue") translate( vv[a]) circle(0.2,$fn=150); 

    #color("DarkBlue") translate(fp) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(gp) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(hp) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(ip) circle(0.2,$fn=150); 

    #color("DarkBlue") translate(f) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(g) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(h) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(i) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(d1) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(d2) circle(0.2,$fn=150); 
    #color("DarkBlue") translate(d3) circle(0.2,$fn=150); 
}


f1 = function() [a,b,c,d,d1,d2,d3,e,f,g,h,i];
f2 = function() [a2,a,b,c,d,d1,d3,e,f,g,h,i];
f3 = function() concat([ap,bp,cp,dp,dp1,dp2],arcBtween(dp2,ep2),[ep2,ep1,ep,fp,gp,hp,ip,j,k,l,m,n,o,p,q]);
//offset(r = 0.4,chamfer= true,$fn=150) polygon( concat(f3()));
offset(r = 0.4,chamfer= true,$fn=150) polygon( concat(f2(),f3()));
#color("DarkBlue") translate(ep) circle(0.2,$fn=150); 
#color("DarkBlue") translate(ep1) circle(0.2,$fn=150); 
#color("DarkBlue") translate(ep2) circle(0.2,$fn=150); 
//color("DarkBlue") translate(ap) circle(0.2,$fn=150); 
#color("DarkBlue") translate(ip) circle(0.2,$fn=150); 
#color("DarkBlue") translate(j) circle(0.2,$fn=150); 
#color("DarkBlue") translate(k) circle(0.2,$fn=150); 
#color("DarkBlue") translate(l) circle(0.2,$fn=150); 
#color("DarkBlue") translate(m) circle(0.2,$fn=150); 
#color("DarkBlue") translate(n) circle(0.2,$fn=150); 
#color("DarkBlue") translate(o) circle(0.2,$fn=150); 
color("DarkBlue") translate(p) circle(0.2,$fn=150); 
color("DarkBlue") translate(q) circle(0.2,$fn=150); 
color("DarkBlue") translate(a2) circle(0.2,$fn=150); 
//color("DarkBlue") translate(hp) circle(0.2,$fn=150); 
//showPath(f3());
//showPath(f2());
    


