clear
k1=2/5; % N/m
k2=1;
m1=1; % kg
m2=2;
delta1=1/10; %
delta2=1/5;
miu1=1/6; %
miu2=1/10;

A=[0 0 1 0; %n x n
   0 0 0 1;
   -k1/m1-k2/m1 , k2/m1 , -delta1/m1 , 0;
   k2/m2, -k2/m2 , 0 , -delta2/m2];

B=[0,0; %n x m
   0,0;
   1/m1,0;
   0,1/m2];

C=[1 0 0 0; %p x n
   0 1 0 0];
Ts=0.1;
[Ad,Bd,Cd,~]=c2dm(A,B,C,[0 0;0 0],Ts);
%%
% Ad=[1 1;0 1]; %n x n
% Bd=[0.5;1]; %n x m
% Cd=[1 0]; %p x n
%%
n=size(Ad,1);
m=size(Bd,2);
p=size(Cd,1);
Np=10;
Nc=10;
%%
Phi_a=[Ad,zeros(n,p);Cd*Ad,eye(p)];
Gamma_a=[Bd;Cd*Bd];
C_a=[zeros(p,n),eye(p)];
W=[];
for i=1:Np
    W=[W;C_a*Phi_a^i];
end

Z=cell(Np,Np);
s=size(C_a*Gamma_a);
for i=1:Np*Np
    Z{i}=zeros(s(1),s(2));
end

for i=1:Np
    for j=1:Np
        if(i>=j)
            % Z((n+p)*(i-1)+1:(n+p)*i,m*(j-1)+1:m*j)=(Phi_a)^(i-j)*Gamma_a;
            Z{i,j}=C_a*(Phi_a)^(i-j)*Gamma_a;
        end
    end
end
Z=cell2mat(Z);
Z=Z(1:end,1:m*Nc);
%%
r=[1;-2];
r=repmat(eye(m),[Np,1])*r;
R=0.1*eye(m*Nc);
Q=1*eye(p*Np);

endsim=100;
xv=zeros(n,endsim);
uv=zeros(m,endsim);

for k=1:endsim
    % x_kp1=A*xv(k)+B*uv(k);
    y_k=Cd*xv(:,k);
    if k==1
        deltax_k=xv(:,k);
    else
        deltax_k=xv(:,k)-xv(:,k-1);
    end
    xa_k=[deltax_k;y_k];

    deltaUstar=inv(R+Z'*Q*Z)*Z'*Q*(r-W*xa_k);
    deltau_k=deltaUstar(1:m); 
    if k==1
        uv(:,k)=deltau_k;
    else
        uv(:,k)=deltau_k+uv(:,k-1);
    end
    xv(:,k+1)=Ad*xv(:,k)+Bd*uv(:,k);
end
figure
plot(0:Ts:(endsim-1)*Ts,xv(1,1:end-1),LineWidth=2)
hold on;
plot(0:Ts:(endsim-1)*Ts,xv(2,1:end-1),LineWidth=2)
plot(0:Ts:(endsim-1)*Ts,xv(3,1:end-1))
plot(0:Ts:(endsim-1)*Ts,xv(4,1:end-1))
grid,title("states")
legend("x_1","x_2","x_3","x_4")
xlabel("time[seconds]")
ylabel("states[m and m/s]")
figure
plot(0:Ts:(endsim-1)*Ts,uv(1,1:end),LineWidth=1)
hold on
plot(0:Ts:(endsim-1)*Ts,uv(2,1:end),LineWidth=1)
grid,title("control")
legend("u_1","u_2")
xlabel("time[seconds]")
ylabel("control[N]")