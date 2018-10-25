function bernuli
    hold on;
    grid on;
    y=dsolve('3*x*Dy+4*x^5*y^4=2*y', 'y(1)=1/2', 'x');
    x=0.5:0.1:5;
    plot(x,eval(y), 'b');
    dy=diff(y);
    a=solve(dy);
    d2y=diff(y,2);
    b=solve(d2y);
    x=a(1);
    plot(x, eval(y), 'ro');
    x=b(2);
    plot(x, eval(y), 'm*');
end
