function Icurve
    axis([-10 10 -20 20])
    hold on;
    grid on;
    [x0, y0] = ginput(5);
    plot(x0,y0,'ro');
    y=dsolve('x*Dy=2*y', 'y(x0)=y0', 'x')
    x=-10:0.01:10;
    plot(x, eval(y))
end
