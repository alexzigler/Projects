figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[0 0],[0 1.2],[-.7 1],[-.5 .5],[-1.5 1.5],[1 -.2],[.4 -.9],[.1 -1.5],[-.8 .8]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@planar_sys,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.2:x2, y1:.2:y2);
dx=sin(x+y);
dy=cos(x-y);
quiver(x,y,dx,dy,'b')
%% stable node
figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[0 1.2],[-.7 1],[-1.5 1.5],[1 -.2],[.4 -.9],[.1 -1.5],[-1 -.5],[1.6 0.6]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@st_node,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.2:x2, y1:.2:y2);
dx=-5*x-8*y;
dy=x+y;
quiver(x,y,dx,dy,'b')

%% unstable node
figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[0.1 0.1],[-.3 .8],[.3 -1],[-.2 1],[-.2,.3],[.1,-.4]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@unst_node,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.2:x2, y1:.2:y2);
dx=x;
dy=3*x+y;
quiver(x,y,dx,dy,'b')

%% saddle point
figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[0.1 0.1],[-.3 .8],[.3 -1],[-.2,.3],[.1,-.4],[-1.2 1.2],[.2 -.2],[-.4 0]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@saddle,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.2:x2, y1:.2:y2);
dx=x+2*y;
dy=3*x+y;
quiver(x,y,dx,dy,'b')

%% stable foci
figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[1.5 1.5],[.3 -1],[-.2,.3],[.1,-.4],[-1.2 1.2],[-.4 0],[-1.4 -1.2]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@st_foci,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.2:x2, y1:.2:y2);
dx=-3*x+2*y;
dy=-2*x-3*y;
quiver(x,y,dx,dy,'b')

%% unstable foci

figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[-1.2 .2],[-.2,.3],[.1,-.4],[-1.2 1.2],[-.4 0],[-0.2 1]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@unst_foci,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.2:x2, y1:.2:y2);
dx=x-2*y;
dy=2*x+y;
quiver(x,y,dx,dy,'b')

%% center
figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[-1.2 .2],[-.2,.3],[.1,-.4],[-1.2 1.2],[-.4 0],[-0.2 1]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@center,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.2:x2, y1:.2:y2);
dx=-2*y;
dy=2*x;
quiver(x,y,dx,dy,'b')

%% limit cycles
figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
initial_conds={[-1.2 .2],[-.2,.3],[.1,-.4],[-1.2 1.2],[-.4 0],[-0.2 1]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@limit_cycle,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end

x1=-2; x2=2; y1=-2; y2=2;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.05:x2, y1:.05:y2);
dx=-y+x*(1-x.^2-y.^2);
dy= x+y*(1-x.^2-y.^2);
% quiver(x,y,dx/norm(dx),dy/norm(dy),'b')
quiver(x,y,dx,dy,'b')

%lyapunov 
figure
x=linspace(-1.1,1.1,100);
y=linspace(-1.1,1.1,100);
[X1,X2] = meshgrid(x,y);
Z = (1-X1.^2-X2.^2).^2;
contour(X1,X2,Z,300)
colorbar
xlabel("x1")
ylabel("x2")
title("V(x)")

%% Lyapunov linearization

figure
plot([],[])
xlabel("x1")
ylabel("x2")
hold on;
plot(4,7,'rx','MarkerSize',8)
plot(-5.21446,7.3217,'rx','MarkerSize',8)
plot(4.32558,-6.98836,'rx','MarkerSize',8)
initial_conds={[4 -9],[3.5 -7],[-8 10],[-3.5 6],[3 5],[5.5 -6]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@linearizz,[0,10],initial_conds{i});
    plot(x(:,1),x(:,2))
end


x1=-10; x2=10; y1=-10; y2=10;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.5:x2, y1:.5:y2);
dx=2*y.^2+x-102;
dy=3*x.*y-22*x-13*y+95;
quiver(x,y,dx,dy,'b')

%% Region of Attraction (ROA)


[x, y] =meshgrid(-.5:0.05:.5,-.5:0.05:.5);
z = 1.5*x.^2+y.^2+x.*y;%v
% z = -x.^2-y.^2+x.*y.^3+4*y.^4-1/4*x.*y.^5-1/2*y.^6;%vdot
figure
contour(x, y, z,[0.158 0.158],'k','LineWidth',2); %V(x)=c - estimated
hold on
radius=f_roa2D();
rectangle('Position',[-radius,-radius,2*radius,2*radius],'EdgeColor','r','LineWidth',2) %brute force
hline = line(NaN,NaN,'LineWidth',2,'Color','r');

xlabel("x1")
ylabel("x2")
plot(0,0,'rx','MarkerSize',8)
initial_conds={[0.5 0.5],[-0.6 -0.6],[1 1],[-3 -3],[0.5,-0.5],[-0.3,-0.3]};

len=length(initial_conds);

for i=1:len
    [~,x]=ode23(@roasys,[0,30],initial_conds{i});
    plot(x(:,1),x(:,2)) %trajectories
end


x1=-3; x2=3; y1=-3; y2=3;
axis([x1 x2 y1 y2]);
[x,y]=meshgrid (x1:.1:x2, y1:.1:y2);
dx=y;
dy=-x-y+2*y.^3-0.5*y.^5;
quiver(x,y,dx,dy,'b') % vector field
legend("Analytical estimation","Brute force")

%% functions
function xp = planar_sys(t,x)
 
    xp(1) = sin(x(1)+x(2)); 
    xp(2) = cos(x(1)-x(2)); 
    xp = xp';

end

function xp = st_node(t,x)
    xp(1) = -5*x(1)-8*x(2);
    xp(2) = x(1)+x(2);
    xp = xp';
end

function xp = saddle(t,x)
    xp(1) = x(1)+2*x(2);
    xp(2) = 3*x(1)+x(2);
    xp = xp';
end

function xp = unst_node(t,x)
    xp(1) = x(1);
    xp(2) = 3*x(1)+x(2);
    xp = xp';
end

function xp = unst_foci(t,x)
    xp(1) = x(1)-2*x(2);
    xp(2) = 2*x(1)+x(2);
    xp = xp';
end

function xp = st_foci(t,x)
    xp(1) = -3*x(1)+2*x(2);
    xp(2) = -2*x(1)-3*x(2);
    xp = xp';
end

function xp = center(t,x)
    xp(1) = -2*x(2);
    xp(2) =  2*x(1);
    xp = xp';
end

function xp = limit_cycle(t,x)
    xp(1) = -x(2)+x(1)*(1-x(1)^2-x(2)^2);
    xp(2) =  x(1)+x(2)*(1-x(1)^2-x(2)^2);
    xp = xp';
end

function xp = linearizz(t,x)

    xp(1) =2*x(2)^2+x(1)-102;
    xp(2) =3*x(1)*x(2)-22*x(1)-13*x(2)+95;
    xp = xp';
end

function xp = roasys(t,x)
    xp(1) =x(2);
    xp(2) =-x(1)-x(2)+2*x(2)^3-1/2*x(2)^5;
    xp = xp';
end
% function xp = roasys(t,x)
%     xp(1) =-x(1)+x(2);
%     xp(2) =-0.1*x(1)^3-x(2)-10*sin(x(3));
%     xp(3) = x(2)-x(3); 
%     xp = xp';
% end