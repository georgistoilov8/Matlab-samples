function Phasemovie
  tmax=20;
  x=-5:0.5:5;
  y=-3:0.2:3;
  axis([-7,7,-4,4]);
  hold on
  xlabel('x')
  ylabel('y')
  plot(0,0,'m*',-pi,0,'m*',pi,0,'m*')
  [X,Y]=meshgrid(x,y);
  P=Y; 
  Q=sin(X+Y);
  D=sqrt(P.^2+Q.^2);
  quiver(X,Y,P./D,Q./D,0.5,'k')
  [x0,y0]=ginput(1);
  [T,Y]=ode45(@ff,[0,tmax],[x0; y0]);% ili s dsolve
  x=Y(:,1); 
  y=Y(:,2);
  for k=1:length(T)
    xx(k)=x(k); yy(k)=y(k);
    plot(xx,yy,'g');
    M(k)=getframe;
  end
  function z=ff(t,y)
    z= [y(2);sin(y(1)+y(2))];
  end
end
