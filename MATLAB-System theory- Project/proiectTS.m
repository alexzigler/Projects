% k1=250;
% k2=700;
% k3=300;
% b=20;
% m1=35;
% m2=45;
%Original above

k1=200;
k2=600;
k3=300;
b=20;
m1=40;
m2=50;
%  syms k1 k2 k3 b m1 m2 s
A=[0 0 1 0;
   0 0 0 1;
   -(k1+k2)/m1 k2/m1 -b/m1 b/m1;
   k2/m2 -(k2+k3)/m2 b/m2 -b/m2];
B=[0 0 1/m1 0]';
C=[1 0 0 0;
   0 1 0 0];
D=[0 0]';
sys=ss(A,B,C,D);
 [num,den]=ss2tf(A,B,C,D);
 H1= tf(num(1,:),den);
 H2=tf(num(2,:),den);
 
%  
%  R2=1;
%  R1=1;


%inv(s*eye(4)-A)*det(s*eye(4)-A)

% p=num(2,:)
% q=den;
% c=deconv([p,zeros(1,10)],q)
%Hankel2=[c(2) c(3) c(4) c(5);c(3) c(4) c(5) c(6); c(4) c(5) c(6) c(7); c(5) c(6) c(7) c(8)]
%[AFCC, BFCC, CFCC, DFCC]=tf2ss(num,den);

%% FCC FCO
AFCO=AFCC';
BFCO=CFCC';
CFCO=BFCC';
DFCO=DFCC';

sys_FCO=ss(AFCO,BFCO,CFCO,DFCO);
a0=den(5);
a1=den(4);
a2=den(3);
a3=den(2);
a4=den(1);


b13=num(1,2);
b12=num(1,3);
b11=num(1,4);
b10=num(1,5);

b23=num(2,2);
b22=num(2,3);
b21=num(2,4);
b20=num(2,5);

%% Lyapunov
Q=eye(4);
P=lyap(A',Q);
eig(P);
t=0:0.01:30000;
[y,t,x]=lsim(sys,ones(1,length(t)),t);
% subplot(311)
% plot(t,x),grid
% legend('x1','x2','x3','x4')
% 
% subplot(312)
% plot(t,y),grid
% legend('y1','y2')
% subplot(312)

v=zeros(1,length(t));
for i=1:length(t)
    v(i)=x(i,:)*P*x(i,:)';
end
% subplot(313)
plot(t,v),grid,xlabel("t"),ylabel("V");
%% Raspuns impuls
%num(1,:);
%den;
%zpk(H1) 
[y1,t]=impulse(H1,2000);
figure
subplot(121)
plot(t,y1);title("impulse")
% y1_a=0.011567/2.35508*sin(2.35508*t).*exp(-0.00015*t)...
%     +0.01345/5.6789*sin(5.6789*t).*exp(-0.44984*t);


y1_a=-0.000015*cos(2.35508*t).*exp(-0.00015*t)...
     +0.011567/2.35508*sin(2.35508*t).*exp(-0.00015*t)...
     +0.000015*cos(5.6789*t).*exp(-0.44984*t)...
     +0.01344/5.6789*sin(5.6789*t).*exp(-0.44984*t);

subplot(122)
plot(t,y1_a,'r');title("analitic")
%% Raspuns step
[y2,t]=step(H1);
subplot(121)
plot(t,y2);title("step");

y2_a=0.0025...
    -0.0020859*cos(2.35508*t).*exp(-0.00015*t)...
    -(0.0000157/2.35508)*sin(2.35508*t).*exp(-0.00015*t)...
    -0.000414*cos(5.6789*t).*exp(-0.44984*t)...
    -(0.00017/5.6789)*sin(5.6789*t).*exp(-0.44984*t);

%figure
%hold on;
subplot(122)
plot(t,y2_a,'r');title("analitic")

%% Raspuns rampa
t=0:0.01:900;
[y3,~]=lsim(H1,t,t);
subplot(121)
plot(t,y3);title("lsim")

y3_a=-0.0000138+0.0025*t...
    +0.0000028*cos(2.35508*t).*exp(-0.00015*t)...
    -0.0020857/2.35508*sin(2.35508*t).*exp(-0.00015*t)...
    +0.000011*cos(5.6789*t).*exp(-0.44984*t)...
    -0.000408/5.6789*sin(5.6789*t).*exp(-0.44984*t);

%hold on;1.0007
subplot(122)
plot(t,y3_a,'r');title("analitic")
hold on;
plot(t,t,'g')
%% performante
step(H1)
h11=tf([-0.000015,0.011567],[1,0.0003052,5.546402]);
h12=tf([0.000015, 0.01345],[1,0.89968,32.4533]);
% figure
% step(h11,30);
% figure 
% step(h12);
%% rl
k=4023;
Hd=series(k,H1);
Ho=feedback(Hd,1);
% rlocus(H1);
step(Ho)
%% ex11
% C=12;
% R1=1;
% R2=1;
% T=1;
% Ti=R2*C;
% Hr=tf(R2/R1*[R2*C,1],[R2*C,0]);
% Hd=series(Hr,Hf);
% Ht=tf([1],[T,1]);

R1=3e4;
R2=2e4;

T=0.5;
Hlocus=tf(R2*[0.025, 0.01,0.45],[R1*T,0.9*T*R1+R1,38*T*R1+0.9*R1,5*T*R1+38*R1+0.025*R2,180*T*R1+5*R1+0.01*R2,180*R1+0.45*R2,0]);
% Hlocus=tf(R2*[0.025, 0.01,0.45],[R1,0.9*R1,38*R1+0.025*R2,5*R1+0.01*R2,180*R1+0.45*R2,0]);
rlocus(Hlocus);
%% syms
atan2(4.2379,1.8)