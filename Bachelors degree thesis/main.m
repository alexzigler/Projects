%% system cmsd

k1=2/5; % N/m
k2=1;
m1=1; % kg
m2=2;
delta1=1/10; %
delta2=1/5;
miu1=1/6; %
miu2=1/10;


%% linearization
A=[0 0 1 0;
   0 0 0 1;
   -k1/m1-k2/m1 , k2/m1 , -delta1/m1 , 0;
   k2/m2, -k2/m2 , 0 , -delta2/m2];

B=[0,0;
   0,0;
   1/m1,0;
   0,1/m2];

C=[1 0 0 0;
   0 1 0 0];

%% fb linearizable

% syms k1 k2 m1 m2 delta1 delta2 miu1 miu2 real

n=4;
x=sym('x',[1,n],'real');
g=[0 0 0 1/m2]';
g=sym(g);

xdot=[x(3);...
      x(4);...
      -delta1/m1*x(3)-k1/m1*x(1)+miu1/m1 * x(1)^3 - k2/m1 * (x(1)-x(2))+miu2/m1*(x(1)-x(2))^3;...
      -delta2/m2*x(4)-k2/m2*(x(2)-x(1))+miu2/m2*(x(2)-x(1))^3];


mat=lie_bracket(x,xdot,g,3);
[bit,i,j]=isInvolutive(x,mat(:,1:(end-1)));

%% fb linearization 

Az=[0 1 0 0;0 0 1 0;0 0 0 1;
    k2^2/m1/m2,0,-(k1+k2)/m1,-delta1/m1];
B=[0; 0; 0; 1/m1];
K=place(Az,B,[-3 -4 -5 -6]);
