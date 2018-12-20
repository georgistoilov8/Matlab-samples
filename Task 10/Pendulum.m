function Pendulum
    %m*L*D2phi+c*L*Dphi+mg*sin(phi)=0
    clear; clf;
    c=0.5; %0.5
    m=2;
    g=9.81;
    L=6;
    tmax=60;
    v0=0.3;phi0=pi/23; t0=0;
    p=0:pi/50:2*pi;
    [T,Y]=ode45(@ff,[t0,tmax],[phi0,v0]);
    phi=Y(:,1); v=Y(:,2);
    x=L*sin(phi); y=-L*cos(phi);
    for k = 1:length(T)
        plot(L*cos(p),L*sin(p),'g')
        hold on
        axis([-L-1 L+1 -L-1 L+1]);
        daspect([1,1,1])
        line([0,x(k)],[0,y(k)],'LineWidth',2);
        plot([-L L],[0 0],':k');
        plot([0 0],[-L L],':k');
        rectangle('Position',[x(k)-0.4 y(k)-0.4 0.8 0.8],'Curvature',[1,1],'FaceColor','r')
        rectangle('Position',[-0.15 -0.15 0.3 0.3],'Curvature',[1,1],'FaceColor','k')
        hold off
        M(k)=getframe;
    end
    %movie(M,2)
    period = 2*pi*sqrt(L/g);
    function u=ff(t,y)
        w=sqrt(g/L); w1=10;
        u= [y(2);-(c/m)*y(2)-(g/L)*sin(y(1))]%+[0;2*sin(w1*t)];
    end
end
