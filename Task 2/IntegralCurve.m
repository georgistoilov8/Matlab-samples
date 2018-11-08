function Icurve2
    axis([-2 2 -2 2])
    hold on;
    grid on;
    [x0, y0] = ginput(10);
    plot(x0,y0,'g*');
    [t,y]=ode45(@ff, [x0,2], y0);
    [t1,y1]=ode45(@ff, [x0, -2], y0);
    plot(t,y,'r',t1,y1,'r');
    function z=ff(t,y)
       z=t.^2+y.^2;
    end
end
