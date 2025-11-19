cmsd_script;
t=0:Ts:30;
len=length(t);

x0=[0.3;-0.6;0.7;-0.5];

%% compare discrete vs continuous
% sim("est_project_cmsd.slx",300);

xd_lin=zeros(4,len);

for i=2:len
    xd_lin(:,i)=cmsd_linear_discrete(Ts,xd_lin(:,i-1),[0.1;0]);
end

figure
% plot(out.tout,out.sim_lin)
hold on;
plot(t,xd_lin(1,:),t,xd_lin(2,:))
legend("x1 - continuosus","x2 - continuous", "x1 - discrete","x2 - discrete")
title("linear")


xd_nlin=zeros(4,len);

for i=2:len
    xd_nlin(:,i)=cmsd_nonlinear_discrete(Ts,xd_nlin(:,i-1),[0.1;0]);
end

figure
% plot(out.tout,out.sim_nlin)
hold on;
plot(t,xd_nlin(1,:),t,xd_nlin(2,:))
legend("x1 - continuosus","x2 - continuous", "x1 - discrete","x2 - discrete")
title("nonlinear")

%% linear and nonlinear sim state fb


x_linsf=zeros(4,len);
x_linsf(:,1)=x0;

for i=2:len
    u=-Kd*x_linsf(:,i-1);
    x_linsf(:,i)=cmsd_linear_discrete(Ts,x_linsf(:,i-1),[u(1);u(2)]);
end

x_nlinsf=zeros(4,len);
x_nlinsf(:,1)=x0;

for i=2:len
    u=-Kd*x_nlinsf(:,i-1);
    x_nlinsf(:,i)=cmsd_nonlinear_discrete(Ts,x_nlinsf(:,i-1),[u(1);u(2)]);
end

figure
plot(t,x_linsf(1,:))
hold on;
plot(t,x_nlinsf(1,:))
title("State feedback linear vs nonlinear")


%% linear and nonlinear sim observer

%lin
x_est_lin=zeros(4,len);
x_lin=zeros(4,len);
y_lin=zeros(2,len);
y_est_lin=zeros(2,len);

x_lin(:,1)=x0;
y_lin(:,1)=C*x0;

for i=2:len
    x_lin(:,i)=cmsd_linear_discrete(Ts,x_lin(:,i-1),[0;0]);
    y_lin(:,i)=C*x_lin(:,i);
    
    u=Ld*(y_lin(:,i-1)-y_est_lin(:,i-1));

    x_est_lin(:,i)=cmsd_linear_discrete(Ts,x_est_lin(:,i-1),[0;0])+u;
    y_est_lin(:,i)=C*x_est_lin(:,i);

end
figure
plot(t,x_lin-x_est_lin)
title("Estimate error on linear system")

%nlin

x_est_nlin=zeros(4,len);
x_nlin=zeros(4,len);
y_nlin=zeros(2,len);
y_est_nlin=zeros(2,len);

x_nlin(:,1)=x0;
y_nlin(:,1)=C*x0;

for i=2:len
    x_nlin(:,i)=cmsd_nonlinear_discrete(Ts,x_nlin(:,i-1),[0;0]);
    y_nlin(:,i)=C*x_nlin(:,i);
    
    uld=Ld*(y_nlin(:,i-1)-y_est_nlin(:,i-1));

    x_est_nlin(:,i)= cmsd_nonlinear_discrete(Ts,x_est_nlin(:,i-1),[0;0]) + uld; 
    y_est_nlin(:,i)=C*x_est_nlin(:,i);

end
figure
plot(t,x_nlin-x_est_nlin)
title("Estimate error on nonlinear system")

%% linear and nonlinear sim state feedback using observer

%lin
x_est_linobsf=zeros(4,len);
x_linobsf=zeros(4,len);
y_linobsf=zeros(2,len);
y_est_linobsf=zeros(2,len);

x_linobsf(:,1)=x0;
y_linobsf(:,1)=C*x0;

for i=2:len
    uld=Ld*(y_linobsf(:,i-1)-y_est_linobsf(:,i-1));
    u=-Kd*x_est_linobsf(:,i-1);

    x_est_linobsf(:,i)=cmsd_linear_discrete(Ts,x_est_linobsf(:,i-1),[u(1);u(2)])+uld;
    y_est_linobsf(:,i)=C*x_est_linobsf(:,i);

    x_linobsf(:,i)=cmsd_linear_discrete(Ts,x_linobsf(:,i-1),[u(1);u(2)]);
    y_linobsf(:,i)=C*x_linobsf(:,i); 
    
end 

plot(t,x_linobsf(1,:),t,x_linsf(1,:))
legend("Ideal State feedback","Observer State feedback")

%nlin
x_est_nlinobsf=zeros(4,len);
x_nlinobsf=zeros(4,len);
y_nlinobsf=zeros(2,len);
y_est_nlinobsf=zeros(2,len);

x_nlinobsf(:,1)=x0;
y_nlinobsf(:,1)=C*x0;

for i=2:len

    uld=Ld*(y_nlinobsf(:,i-1)-y_est_nlinobsf(:,i-1));
    u=-Kd*x_est_nlinobsf(:,i-1);

    x_nlinobsf(:,i)=cmsd_nonlinear_discrete(Ts,x_nlinobsf(:,i-1),[u(1);u(2)]);
    y_nlinobsf(:,i)=C*x_nlinobsf(:,i);

    x_est_nlinobsf(:,i)= cmsd_nonlinear_discrete(Ts,x_est_nlinobsf(:,i-1),[u(1);u(2)]) + uld; 
    y_est_nlinobsf(:,i)=C*x_est_nlinobsf(:,i);
    
end 
plot(t,x_nlinobsf(1:2,:),t,x_nlinsf(1:2,:))
legend("Ideal State feedback","Observer State feedback")