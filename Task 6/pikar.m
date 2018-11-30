function Pikar
    hold on;
    grid on;

    xmin = -4;
    xmax = 4;

    x0 = 0;
    y0 = 1;
    
    axis([xmin xmax -10 20]);
    y = dsolve('Dy=y', 'y(0)=1');
    t=xmin:(xmax-xmin)/100:xmax;
    plot(t, eval(y), 'k');
    xlabel('x');
    ylabel('y');
    N = 5;
    x = x0:(xmin-x0)/100:xmin;
    xx = x0:(xmax-x0)/100:xmax;
    y_0 = y0*ones(1, length(x));
    yy_0 = y0*ones(1, length(xx));
    
    z = y_0;
    zz = yy_0;
    
    for k=1:N
       yk = y0+cumtrapz(x, ff(x,z));
       yyk = y0 + cumtrapz(xx, ff(xx, zz));
       plot(x, z, 'r', xx, zz, 'r');
       z = yk;
       zz = yyk;
    end
    
    function z = ff(x, y)
        z = y;
    end
end
