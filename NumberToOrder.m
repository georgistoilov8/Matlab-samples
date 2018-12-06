function Num2order
  hold on
  h=[0.5,0.3,0.05];
  x=[];y=[];
  L=20;
  for k=1:length(h)
    x=0:h(k):L;
    y(1)=3;
    z0=0;
    y(2)=y(1)+h(k)*z0+h(k)^2*ff(x(1),y(1),z0);
    for j=2:length(x)-1
      y(j+1)=2*y(j)-y(j-1)+h(k)^2*ff(x(j),y(j),(y(j)-y(j-1))/h(k));
    end
    if k==1
      plot(x,y,'b')
    elseif k==2
      plot(x,y,'g')
    else
      plot(x,y,'m')
    end
  end
  function u=ff(x,y,z)
    u=-4*y-0.5*z;
  end
  [T,Y]=ode45(@rhs,[0,L],[3,0]);
  plot(T,Y(:,1),'k')
  grid on
  legend('h=0.5','h=0.3','h=0.05','ode45')
  function z=rhs(t,v)
    z=[v(2);-4*v(1)-0.5*v(2)];
  end
end
