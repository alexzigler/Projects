load("z_closed")

% data=iddata(y(981:end),u(981:end),0.01);
data=z_closed_Azi035;
plot(data)
Ho=tf(tfest(data,2));

P=4.9395;
I=0.0023;
D=5.188;
N=100;

Hr=tf([D*N+P,I+P*N,I*N],[1 N 0]);

Hf=minreal(series(1/Hr,Ho/(1-Ho)));

[num,den]=tfdata(Hf,'v');
%%
% load("model_azimuth")
% load("z_closed")
% 
% dataname=z_closed_Azi035;
% P=4.9395;
% I=0.0023;
% D=5.188;
% N=100;
% 
% Hr=tf([D*N+P,I+P*N,I*N],[1 N 0]);
% Ho=series(Hf,Hr);
% Ho=feedback(Ho,1);
% lsim(Ho,dataname.u,timeyy(dataname))
% hold on
% plot(timeyy(dataname),dataname.y)

%% full id azi
s=load("z_closed.mat");
load("z_closed.mat")
fn = fieldnames(s);
for k=1:numel(fn)
        array{k}=s.(fn{k});
end

[mse,model]=bestfriend1(array(1:5),1);
%%


dataname=array{5};
P=4.9395;
I=0.0023;
D=5.188;
N=100;

% Hr=tf([D*N+P,I+P*N,I*N],[1 N 0]);
Hr=tf([D,P,I],[1 0]);
Ho=series(model,Hr);
Ho=feedback(Ho,1);
figure
lsim(Ho,dataname.u,timeyy(dataname))
hold on
plot(timeyy(dataname),dataname.y,'r')
legend("y_{aprox}","y_{real}")
%%
Ho=tf4;
P=4.9395;
    I=0.0023;
    D=5.188;
    N=100;
    Hr=tf([D,P,I],[1 0]);
%             Hr=tf([D*N+P,I+P*N,I*N],[1 N 0]);

    Hf=minreal(series(1/Hr,Ho/(1-Ho)));


%% pitchyyyy

s=load("z_closed.mat");

fn = fieldnames(s);
for k=1:numel(fn)
        array{k}=s.(fn{k});
end
