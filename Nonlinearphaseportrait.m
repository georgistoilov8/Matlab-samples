function Nonlinearphaseportrait
tmax=5;
function z=ff(t,y)
z=[y(2); sin(y(1)+y(2))];
end
k=1;
A=[0,1;(-1)^k,(-1)^k];
a=k*pi;b=0;
function u=fl(t,y)
    u=A*(y-[a;b]);
end
d=4;s=1.2;
x=a-d:s:a+d;
y=b-d:s:b+d;
% chertane na fazovia portret
[X,Y]=meshgrid(x,y);
for i=1:length(x)
for j=1:length(y)
[T,Z]=ode45(@fl,[0,tmax],[X(i,j),Y(i,j)]);
[T1,Z1]=ode45(@fl,[0,-tmax],[X(i,j), Y(i,j)]);
[T2,Z2]=ode45(@ff,[0,tmax],[X(i,j),Y(i,j)]);
[T3,Z3]=ode45(@ff,[0,-tmax],[X(i,j), Y(i,j)]);
subplot(2,1,1)
hold on
plot(a,b,'ro')
plot(Z2(:,1),Z2(:,2),'b',Z3(:,1),Z3(:,2),'b')
axis([a-d-1, a+d+1,b-d-1,b+d+1])
title('nonlinear system')
xlabel('x')
ylabel('y')
subplot(2,1,2)
hold on
plot(a,b,'ro')
axis([a-d-1, a+d+1,b-d-1,b+d+1]);
plot(Z(:,1),Z(:,2),'b',Z1(:,1),Z1(:,2),'b')
title('linear aapproximation')
xlabel('x')
ylabel('y')
end
end
% chertane na vektornite ploeta
P=Y; Q=sin(X+Y);
D=sqrt(P.^2+Q.^2);
subplot(2,1,1)
quiver(X,Y,P./D,Q./D,0.5,'m')
PL=A(1,1)*(X-a)+A(1,2)*(Y-b);
QL=A(2,1)*(X-a)+A(2,2)*(Y-b);
DL=sqrt(PL.^2+QL.^2);
subplot(2,1,2)
quiver(X,Y,PL./DL,QL./DL,0.5,'m')
end

