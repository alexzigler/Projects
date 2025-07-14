% Rails and trains
L=62832;

u=1;

train_velocity_far=50;
train_acc_close=(30-50)/25;
train_acc_passed=(50-30)/2.5;

barrier_dist01=1300;
barrier_dist12=9300;
barrier_dist23=11300;
barrier_dist34=31300;

barrier_dist02=barrier_dist01+barrier_dist12;
barrier_dist03=barrier_dist02+barrier_dist23;
barrier_dist04=barrier_dist03+barrier_dist34;
trains=3;
%info: it takes 1260 seconds to complete the circle at full const spd 50mps 
start_times=[0 50 240];

% Car parameters
V=28;%mps
v=0.15*V;
% a_cruise_stop=-5; % adjust to match d
% a_stop_start=1.5;
% a_cruise=6;

%Road
D=150;%m
d=5;%m
road_b_d1=7000;
road_b_d2=11000;
road_b_d3=15000;
road_b_d4=20000;

%%
load("sldemo_autotrans_data.mat");
load("VehicleManeuvers.mat")