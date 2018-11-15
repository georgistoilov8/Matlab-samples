function Euler
   x0 = 0;
   xmax = 2;
   y0 = -1;
   yy = dsolve('Dy = -(y*tan(x))+(cos(x))^2', 'y(0)=-1', 'x');
   s = x0:(xmax - x0)/100:xmax;
   z = subs(yy, 'x', s);
   plot(s, z, 'k');
   
   hold on;
   grid on;
   
   h = [0.5, 0.2, 0.1];
   x(1) = x0;
   y(1) = y0;
   for i = 1:length(h)
       x = x0:h(i):xmax;
       for k = 1:(length(x) - 1)
           y(k+1) = y(k) + (y(k)*tan(x(k)) + (cos(x(k)))^2)*h(i);
       end
       plot(x,y);
   end
end
