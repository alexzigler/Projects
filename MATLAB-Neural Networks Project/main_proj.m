%% init
m=30;
n=31-m;
H=tf([n+2],conv([3-n,1],[3+n,1]));
%% Cerinta 2
load("plant_data.mat")
% [plant_in_p, input_settings] = mapminmax(plant_in.Data);
% [plant_out_p, output_settings] = mapminmax(plant_out.Data);

plant_in_p=con2seq(plant_in.Data');
plant_out_p=con2seq(plant_out.Data');

net_plant = narxnet(1:5,1:5,10);% 10 neuroni
net_plant.trainParam.epochs=1000;
net_plant.trainParam.goal=1e-40;
net_plant.trainParam.min_grad=1e-3000;
net_plant.layers{1}.transferFcn = 'purelin';
net_plant.layers{2}.transferFcn = 'purelin';
[Xs, Xi, Ai, Ts] = preparets(net_plant, plant_in_p, {}, plant_out_p);
net_plant_trained = train(net_plant,Xs,Ts);

%% Cerinta 3 - validare
% Simulate the network response
y_pred = net_plant_trained(Xs, Xi, Ai);

% Plot the actual vs predicted outputs
plot(cell2mat(Ts), 'b');
hold on;
plot(cell2mat(y_pred), 'r--');
grid on
legend('Actual Output', 'Predicted Output');
title('NARX Network Output Comparison');
perf = perform(net_plant_trained, Ts, y_pred);
%% Cerinta 3 - retea in simulink + validare
net_plant_trained_c=closeloop(net_plant_trained);
gensim(net_plant_trained_c,0.01)
%% Cerinta 4 - proiectare controller
m=30;
n=31-m;
H=tf([n+2],conv([3-n,1],[3+n,1]));
% step(H)
% L=0.3;
% T=6.35-L;
% kp=1.2*T/L;
% ki=2*L;
% kd=0.5*L;

kp=5.366;
ki=4.47;
kd=1.117;
Hr=pidstd(kp,ki,kd,100);
Hr=series(Hr,tf(1,conv([0.01 1],[0.01 1])));

% kp=1.7;
% ki=8.171;
% Hr=pidstd(kp,ki);

Ho=feedback(series(H,Hr),1);    
step(H)
hold on
step(Ho)
grid on
legend("Open loop(Plant)","Closed loop(Controlled)")
%% Cerinta 5
load("pi_data.mat")
pid_in_p=con2seq(pid_in.Data');
pid_out_p=con2seq(pid_out.Data');

% net_pid = narxnet(1:12,1:12,20);% pi
net_pid = narxnet(1:7,1:7,20);% pid
net_pid.trainParam.epochs=1000;
net_pid.trainParam.goal=1e-40;
net_pid.trainParam.min_grad=1e-3000;
net_pid.layers{1}.transferFcn = 'purelin';
% net_pid.layers{2}.transferFcn = 'purelin';
[Xs, Xi, Ai, Ts] = preparets(net_pid, pid_in_p, {}, pid_out_p);
net_pid_trained = train(net_pid,Xs,Ts);

%% Cerinta 5 - validare
% Simulate the network response
y_pred = net_pid_trained(Xs, Xi, Ai);

% Plot the actual vs predicted outputs
plot(cell2mat(Ts), 'b');
hold on;
plot(cell2mat(y_pred), 'r--');
legend('Actual Output', 'Predicted Output');
title('NARX Network Output Comparison');
perf = perform(net_pid_trained, Ts, y_pred);
%% Cerinta 6 - retea in simulink + validare
net_pid_trained_c=closeloop(net_pid_trained);
gensim(net_pid_trained_c,0.01)
%% Cerinta 7 - IMC
m=30;
n=31-m;
H=tf([n+2],conv([3-n,1],[3+n,1]));
filter_3=conv([0.1,1],conv([0.1 1],[0.1 1]));
%
load("imc_c_data.mat")
imc_c_in_p=con2seq(imc_c_in.Data');
imc_c_out_p=con2seq(imc_c_out.Data');

net_imc = narxnet(1:4,1:4,14);% 

net_imc.trainParam.epochs=2000;
net_imc.trainParam.goal=1e-60;
net_imc.trainParam.min_grad=1e-3000;
net_imc.layers{1}.transferFcn = 'purelin';
% net_imc.layers{2}.transferFcn = 'purelin';
[Xs, Xi, Ai, Ts] = preparets(net_imc, imc_c_in_p, {}, imc_c_out_p);
net_imc_trained = train(net_imc,Xs,Ts);

% Cerinta 7 - IMC
% Simulate the network response
y_pred = net_imc_trained(Xs, Xi, Ai);

% Plot the actual vs predicted outputs
% plot(cell2mat(Ts), 'b');
% hold on;
% plot(cell2mat(y_pred), 'r--');
% legend('Actual Output', 'Predicted Output');
% title('NARX Network Output Comparison');
perf = perform(net_imc_trained, Ts, y_pred);
%% Cerinta 7 - IMC
net_imc_trained_c=closeloop(net_imc_trained);
gensim(net_imc_trained_c,0.01)
%% IMC2
m=30;
n=31-m;
H=tf([n+2],conv([3-n,1],[3+n,1]));
filter_x=conv([0.7,1],conv([0.7 1],[0.7 1]));

load("imc_c_data2.mat")
imc_c_in2_p=con2seq(imc_c_in2.Data');
imc_c_out2_p=con2seq(imc_c_out2.Data');

net_imc2 = narxnet(1:6,1:6,15);% 

net_imc2.trainParam.epochs=2000;
net_imc2.trainParam.goal=1e-60;
net_imc2.trainParam.min_grad=1e-3000;
net_imc2.layers{1}.transferFcn = 'purelin';
% net_imc2.layers{2}.transferFcn = 'purelin';
[Xs, Xi, Ai, Ts] = preparets(net_imc2, imc_c_in2_p, {}, imc_c_out2_p);
net_imc2_trained = train(net_imc2,Xs,Ts);
y_pred = net_imc2_trained(Xs, Xi, Ai);
perf = perform(net_imc2_trained, Ts, y_pred);
%% IMC2
net_imc2_trained_c=closeloop(net_imc2_trained);
gensim(net_imc2_trained_c,0.01)