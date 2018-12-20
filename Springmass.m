function Springmass
    %m*D2u+c*Du+k*u=f(t)
    %c=0;m=4;k=4.
    clear;
    L=6;
    t0=0;
    u0=2;v0=1;
    tmax=100;
    t=t0:(tmax-t0)/100:tmax;
    u=dsolve('20*D2u+0.3*Du+0.1*u=0','u(t0)=u0','Du(t0)=v0');
    u=eval(u);
    for i = 1:length(t)
        clf
        x(i)=0;
        y(i)=-L-u(i);
        epsi=L/12;
        hold on
        plot([-2 2],[0 0],'k','LineWidth',3);
        plot([-2,2],[-L-epsi,-L-epsi],':k')
        for j=-2:0.5:2
            plot([j,j+1/2],[0 1],'k')
        end
        plot([0,0],[0, -2*epsi],'g',0,-2*epsi,'LineWidth',2);
        s=y(i)+2*epsi:1/100:-2*epsi;
        plot(sin(10*pi*(s+2*epsi)/(y(i)+4*epsi))/3,s,'g','LineWidth',2)
        plot([0,0],[y(i)+2*epsi, y(i)],'g','LineWidth',2);
        rectangle('Position',[-epsi,y(i)-2*epsi,2*epsi,2*epsi],'FaceColor','r')
        rectangle('Position',[0-0.9 0-0.2 0.4 0.4],'Curvature',[1,1],'FaceColor','k')
        axis([-2 2 -1.8*L 1])
        title('vertical spring-mass system')
        F(i)=getframe;
    end
    %movie(F,3)
end
