cmsd_script;
x0=[0.3;-0.6;0.7;-0.5];
xhat0=[0;0;0;0];

alfa1=1e-4;
alfa2=1e-3;

Q=alfa1/2*eye(4); %variance -disturbance
R=alfa2/2*eye(2); %variance - noise 
P=1e10*eye(4);

kmax=30001;
u=zeros(2,kmax);
y=zeros(2,kmax);
x=zeros(4,kmax);
% x_true=zeros(4,kmax);
xhat=zeros(4,kmax);
xpred=zeros(4,kmax);

w= sqrt(alfa1) * randn(4,kmax); % standard deviation
v= sqrt(alfa2) * randn(2,kmax);

% w= zeros(4,kmax); 
% v= zeros(2,kmax);

x(:,1)=x0;
xhat(:,1)=xhat0;

for k=2:kmax
    u(:,k-1)=-Kd*xhat(:,k-1);
%       u(:,k-1)=[0.1;0];    
    x(:,k)=Ad*x(:,k-1)+Bd*u(:,k-1)+w(:,k-1);
    y(:,k)=C*x(:,k)+v(:,k);

    xpred(:,k)=Ad*xhat(:,k-1) +Bd*u(:,k-1);
    Ppred=A*P*A'+Q;
    Kk=Ppred*C'*inv(C*Ppred*C'+R);
    xhat(:,k)=xpred(:,k)+Kk*(y(:,k)-C*xpred(:,k));
    P=(eye(4)-Kk*C)*Ppred*(eye(4)-Kk*C)'+Kk*R*Kk';
end

figure
plot(0:Ts:(kmax-1)*Ts,x(1,:),'b')
hold on;
plot(0:Ts:(kmax-1)*Ts,xhat(1,:))




