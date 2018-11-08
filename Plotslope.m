function Plotslope
   x = -5:0.3:5;
   y = -5:0.3:5;
   delta = 0.2;
   hold on;
   axis([-6,6,-6,6]);
   grid on;
   for k=1:length(x)
       for m=1:length(y)
           eps = delta/sqrt(1+f(x(k), y(m))^2);
           plot([x(k)-eps, x(k)+eps],[y(m)-eps*f(x(k), y(m)), y(m)+eps*f(x(k), y(m))], 'k');
           plot(x(k), y(m), 'k.');
       end
   end
   [x0, y0] = ginput(1);
   plot(x0, y0, 'bo');
   [T, Y] = ode45(@f, [x0, 5], y0);
   [T1, Y1]=ode45(@f, [x0, -5], y0);
   plot(T, Y, 'b', T1, Y1, 'b');
   function z = f(x,y)
       z = x^2 + y^2;
   end
end
