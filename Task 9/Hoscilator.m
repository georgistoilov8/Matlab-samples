function Hoscilator
  %clear
  %clf
  t0=0;y0=1;v0=1;
  tmax=30;c=2;w=4;
  y=simplify(dsolve('D2y+0.1*Dy+16*y=3*sin((0.4)*t)','y(0)=1','Dy(0)=1'))
  dy=diff(y);
  t=t0:(tmax-t0)/200:tmax;
  Y=eval(y);DY=eval(dy);
  for k = 1: length(t)
    subplot(3,1,1)
    plot(t(1:k),Y(1:k))
    axis([t0,tmax,-2.5,2.5])
    grid on
    xlabel('t')
    ylabel('y')
    subplot(3,1,2)
    plot(t(1:k),DY(1:k))
    axis([t0,tmax,-8,8])
    grid on
    xlabel('t')
    ylabel('y^{\prime}')
    subplot(3,1,3)
    plot(Y(1:k),DY(1:k))
    axis([-8,8,-8,8])
    grid on
    xlabel('y')
    ylabel('y^{\prime}')
    M(k)=getframe;
  end
end
