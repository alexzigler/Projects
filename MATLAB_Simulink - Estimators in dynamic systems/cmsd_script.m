
%numerical values
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

coab=[B , A*B , A^2*B , A^3*B];
obac=[C ; C*A ; C*A^2 ; C*A^3];


% sys=ss(A,B,C,[0 0; 0 0]);
% step(sys)

%% tf
% syms s 
% tfu = C*inv(s*eye(4)-A)*B;
%% linear observer and state fb controller

K=place(A,B,[-3,-3,-4,-4]);
L=place(A',C',[-10,-10,-20,-20])';
F=inv(C*inv(-A+B*K)*B);

%% discrete 

Ts=0.01; % bcs max( re{eig(a)} ) = 0.05;

Ad=eye(4)+Ts*A;
Bd=Ts*B;

Kd=place(Ad,Bd,[exp(-3*Ts),exp(-3*Ts),exp(-4*Ts),exp(-4*Ts)]);
Ld=place(Ad',C',[exp(-10*Ts),exp(-10*Ts),exp(-20*Ts),exp(-20*Ts)])';

%% intrari
E=[7 2 1 3]';
Ae=[A,E;zeros(1,5)];
Be=[B; 0 0];
Ce=[C ,zeros(2,1)];

Le = place(Ae',Ce',[-5 -6 -7 -8 -9])';

% lab9

H=E*pinv(C*E);
T=eye(4)-H*C;

K1=place((T*A)',C',[-10 -11 -12 -13])';
F=T*A-K1*C;
K2=F*H;

Ks=K1+K2;
