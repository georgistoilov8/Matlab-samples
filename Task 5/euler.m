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
   for k=1:length(h)
       x=x0:h(k):xmax;
       for j= 1:length(x)-1
           y(j+1)=y(j)+h(k)*(cos(x(j))^2-y(j)*tan(x(j)));
       end
       plot(x,y);
   end
end
