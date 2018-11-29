function Unsolve
axis([-8,8,-8,8])
hold on
grid on
syms x y z
ff=z^2+5*y-x^2-x*z;
dff=diff(ff,z);
[y,z]=solve(ff,dff,y,z)
x=-8:1/100:8;
yy=eval(y);
plot(x,yy,'k')
[x0,y0]=ginput(1);
plot(x0,y0,'r*')
if y0>x0^2/4
text(x0+0.1,y0,'no solution')
else
y1=dsolve('(Dy)^2-x*Dy-x^2+5*y=0','y(x0)=y0','x');
plot(x,eval(y1))
end
end
