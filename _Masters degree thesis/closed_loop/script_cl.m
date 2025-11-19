data=out.logsout;
endd=50001;

xref=data.get("xref").Values.Data(1:endd);
yref=data.get("yref").Values.Data(1:endd);
zref=data.get("zref").Values.Data(1:endd);
phiref=data.get("phiref").Values.Data(1:endd);
thetaref=data.get("thetaref").Values.Data(1:endd);
psiref=data.get("psiref").Values.Data(1:endd);
timex=data.get("xref").Values.Time(1:endd);


%pp
pp_F_thrust=squeeze(data.get("pp_F_thrust").Values.Data(1:endd));
pp_M1=squeeze(data.get("pp_M1").Values.Data(1:endd));
pp_M2=squeeze(data.get("pp_M2").Values.Data(1:endd));
pp_M3=squeeze(data.get("pp_M3").Values.Data(1:endd));

pp_left=data.get("pp_left").Values.Data(1:endd);
pp_right=data.get("pp_right").Values.Data(1:endd);
pp_front=data.get("pp_front").Values.Data(1:endd);
pp_back=data.get("pp_back").Values.Data(1:endd);

x_pp=squeeze(data.get("x_pp").Values.Data(1:endd));
y_pp=squeeze(data.get("y_pp").Values.Data(1:endd));
z_pp=squeeze(data.get("z_pp").Values.Data(1:endd));
phi_pp=squeeze(data.get("phi_pp").Values.Data(1:endd));
theta_pp=squeeze(data.get("theta_pp").Values.Data(1:endd));
psi_pp=squeeze(data.get("psi_pp").Values.Data(1:endd));

%lqr
lqr_F_thrust=squeeze(data.get("lqr_F_thrust").Values.Data(1:endd));
lqr_M1=squeeze(data.get("lqr_M1").Values.Data(1:endd));
lqr_M2=squeeze(data.get("lqr_M2").Values.Data(1:endd));
lqr_M3=squeeze(data.get("lqr_M3").Values.Data(1:endd));

lqr_left=data.get("lqr_left").Values.Data(1:endd);
lqr_right=data.get("lqr_right").Values.Data(1:endd);
lqr_front=data.get("lqr_front").Values.Data(1:endd);
lqr_back=data.get("lqr_back").Values.Data(1:endd);

x_lqr=squeeze(data.get("x_lqr").Values.Data(1:endd));
y_lqr=squeeze(data.get("y_lqr").Values.Data(1:endd));
z_lqr=squeeze(data.get("z_lqr").Values.Data(1:endd));
phi_lqr=squeeze(data.get("phi_lqr").Values.Data(1:endd));
theta_lqr=squeeze(data.get("theta_lqr").Values.Data(1:endd));
psi_lqr=squeeze(data.get("psi_lqr").Values.Data(1:endd));

%smc2
SMC2_F_thrust=data.get("SMC2_F_Thrust").Values.Data(1:endd);
SMC2_M1=data.get("SMC2_M1").Values.Data(1:endd);
SMC2_M2=data.get("SMC2_M2").Values.Data(1:endd);
SMC2_M3=data.get("SMC2_M3").Values.Data(1:endd);

SMC2_left=data.get("SMC2_left").Values.Data(1:endd);
SMC2_right=data.get("SMC2_right").Values.Data(1:endd);
SMC2_front=data.get("SMC2_front").Values.Data(1:endd);
SMC2_back=data.get("SMC2_back").Values.Data(1:endd);

x_2smc=data.get("x_2smc").Values.Data(1:endd);
y_2smc=data.get("y_2smc").Values.Data(1:endd);
z_2smc=data.get("z_2smc").Values.Data(1:endd);
phi_2smc=data.get("phi_2smc").Values.Data(1:endd);
theta_2smc=data.get("theta_2smc").Values.Data(1:endd);
psi_2smc=data.get("psi_2smc").Values.Data(1:endd);

%asmc
ASMC_F_thrust=squeeze(data.get("ASMC_F_Thrust").Values.Data(1:endd));
ASMC_M1=squeeze(data.get("ASMC_M1").Values.Data(1:endd));
ASMC_M2=squeeze(data.get("ASMC_M2").Values.Data(1:endd));
ASMC_M3=squeeze(data.get("ASMC_M3").Values.Data(1:endd));

ASMC_left=data.get("ASMC_left").Values.Data(1:endd);
ASMC_right=data.get("ASMC_right").Values.Data(1:endd);
ASMC_front=data.get("ASMC_front").Values.Data(1:endd);
ASMC_back=data.get("ASMC_back").Values.Data(1:endd);

x_asmc=squeeze(data.get("x_asmc").Values.Data(1:endd));
y_asmc=squeeze(data.get("y_asmc").Values.Data(1:endd));
z_asmc=squeeze(data.get("z_asmc").Values.Data(1:endd));
phi_asmc=squeeze(data.get("phi_asmc").Values.Data(1:endd));
theta_asmc=squeeze(data.get("theta_asmc").Values.Data(1:endd));
psi_asmc=squeeze(data.get("psi_asmc").Values.Data(1:endd));


%% main plot - states
tiledlayout(3,2)

ax1=nexttile;
plot(timex, xref, 'k-', 'LineWidth', 2); hold on;
plot(timex, x_pp, 'b--', 'LineWidth', 1.5);
plot(timex, x_lqr, 'r:',  'LineWidth', 1.5);
plot(timex, x_2smc, 'g-.', 'LineWidth', 1.5);
plot(timex, x_asmc, 'm-',  'LineWidth', 1.5);
xlabel("Time [sec]")
leg1=legend("Reference","Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control");
grid
title("x [meters]","FontWeight","normal","FontSize",15)
set(leg1, 'FontSize', 8)
set(gca, 'FontSize', 12);
% ylim([0 25])
ax2=nexttile;
plot(timex, phiref, 'k-', 'LineWidth', 2); hold on;
plot(timex, phi_pp, 'b--', 'LineWidth', 1.5);
plot(timex, phi_lqr, 'r:',  'LineWidth', 1.5);
plot(timex, phi_2smc, 'g-.', 'LineWidth', 1.5);
plot(timex, phi_asmc, 'm-',  'LineWidth', 1.5);
xlabel("Time [sec]")
leg2=legend("Reference","Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control");
grid
title("$\phi$ [rad]",'interpreter',"latex","FontSize",15)
% ylim([-.5 .5])
set(leg2, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax3=nexttile;
plot(timex, yref, 'k-', 'LineWidth', 2); hold on;
plot(timex, y_pp, 'b--', 'LineWidth', 1.5);
plot(timex, y_lqr, 'r:',  'LineWidth', 1.5);
plot(timex, y_2smc, 'g-.', 'LineWidth', 1.5);
plot(timex, y_asmc, 'm-',  'LineWidth', 1.5);
xlabel("Time [sec]")
leg3=legend("Reference","Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control");
grid
title("y [meters]","FontWeight","normal","FontSize",15)
% ylim([0 25])
set(leg3, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax4=nexttile;
plot(timex, thetaref, 'k-', 'LineWidth', 2); hold on;
plot(timex, theta_pp, 'b--', 'LineWidth', 1.5);
plot(timex, theta_lqr, 'r:',  'LineWidth', 1.5);
plot(timex, theta_2smc, 'g-.', 'LineWidth', 1.5);
plot(timex, theta_asmc, 'm-',  'LineWidth', 1.5);
xlabel("Time [sec]")
leg4=legend("Reference","Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control");
grid
title("$\theta$ [rad]",'interpreter',"latex","FontSize",15)
% ylim([-.5 .5])
set(leg4, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax5=nexttile;
plot(timex, zref, 'k-', 'LineWidth', 2); hold on;
plot(timex, z_pp, 'b--', 'LineWidth', 1.5);
plot(timex, z_lqr, 'r:',  'LineWidth', 1.5);
plot(timex, z_2smc, 'g-.', 'LineWidth', 1.5);
plot(timex, z_asmc, 'm-',  'LineWidth', 1.5);
xlabel("Time [sec]")
leg5=legend("Reference","Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control");
grid
title("z [meters]","FontWeight","normal","FontSize",15)
set(leg5, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax6=nexttile;
plot(timex, psiref, 'k-', 'LineWidth', 2); hold on;
plot(timex, psi_pp, 'b--', 'LineWidth', 1.5);
plot(timex, psi_lqr, 'r:',  'LineWidth', 1.5);
plot(timex, psi_2smc, 'g-.', 'LineWidth', 1.5);
plot(timex, psi_asmc, 'm-',  'LineWidth', 1.5);
xlabel("Time [sec]")
leg6=legend("Reference","Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control");
grid
title("$\psi$ [rad]",'Interpreter',"latex","FontSize",15)
set(gca, 'FontSize', 12);
set(leg6, 'FontSize', 8)
% linkaxes([ax1, ax2, ax3, ax4, ax5, ax6], 'xy');
f1=gcf;
%% control signals - forces
tiledlayout(2,2)

ax1=nexttile;
plot(timex, pp_F_thrust, 'LineWidth', 2); hold on;
plot(timex, lqr_F_thrust,  'LineWidth', 2);
plot(timex, SMC2_F_thrust, 'LineWidth', 2);
plot(timex, ASMC_F_thrust, 'LineWidth', 2);
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Thrust Force [N]","FontWeight","normal","FontSize",15);
% ylim([0 30])
set(gca, 'FontSize', 12);
ax2=nexttile;
plot(timex, pp_M1, 'LineWidth', 2); hold on;
plot(timex, lqr_M1,  'LineWidth', 2);
plot(timex, SMC2_M1, 'LineWidth', 2);
plot(timex, ASMC_M1, 'LineWidth', 2);
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Moment about x axis - roll command [Nm]","FontWeight","normal","FontSize",15);
% ylim([-2 3])
set(gca, 'FontSize', 12);
ax3=nexttile;
plot(timex, pp_M2, 'LineWidth', 2); hold on;
plot(timex, lqr_M2,  'LineWidth', 2);
plot(timex, SMC2_M2, 'LineWidth', 2);
plot(timex, ASMC_M2, 'LineWidth', 2);
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Moment about y axis - pitch command [Nm]","FontWeight","normal","FontSize",15);
% ylim([-2 3])
set(gca, 'FontSize', 12);
ax4=nexttile;
plot(timex, pp_M3, 'LineWidth', 2); hold on;
plot(timex, lqr_M3,  'LineWidth', 2);
plot(timex, SMC2_M3, 'LineWidth', 2);
plot(timex, ASMC_M3, 'LineWidth', 2);
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Moment about z axis - yaw command [Nm]","FontWeight","normal","FontSize",15);
% ylim([-0.1 0.5])
set(gca, 'FontSize', 12);

%% control signals - motor angular velocities
tiledlayout(2,2)

ax1=nexttile;
plot(timex, pp_front, 'LineWidth', 2,'LineStyle','--'); hold on;
plot(timex, lqr_front,  'LineWidth', 2,'LineStyle',':');
plot(timex, SMC2_front, 'LineWidth', 3);
plot(timex, ASMC_front, 'LineWidth', 2,'LineStyle','-.');
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Front propeller angular velocity [rad/s]","FontWeight","normal","FontSize",15);
set(gca, 'FontSize', 12);
ax2=nexttile;
plot(timex, pp_back, 'LineWidth', 2,'LineStyle','--'); hold on;
plot(timex, lqr_back,  'LineWidth', 2,'LineStyle',':');
plot(timex, SMC2_back, 'LineWidth', 3);
plot(timex, ASMC_back, 'LineWidth', 2,'LineStyle','-.');
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Back propeller angular velocity [rad/s]","FontWeight","normal","FontSize",15);
set(gca, 'FontSize', 12);
ax3=nexttile;
plot(timex, pp_left, 'LineWidth', 2,'LineStyle','--'); hold on;
plot(timex, lqr_left,  'LineWidth', 2,'LineStyle',':');
plot(timex, SMC2_left, 'LineWidth', 3);
plot(timex, ASMC_left, 'LineWidth', 2,'LineStyle','-.');
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Left propeller angular velocity [rad/s]","FontWeight","normal","FontSize",15);
set(gca, 'FontSize', 12);
ax4=nexttile;
plot(timex, pp_right, 'LineWidth', 2,'LineStyle','--'); hold on;
plot(timex, lqr_right,  'LineWidth', 2,'LineStyle',':');
plot(timex, SMC2_right, 'LineWidth', 3);
plot(timex, ASMC_right, 'LineWidth', 2,'LineStyle','-.');
grid
xlabel("Time [sec]")
legend("Feedback Linearization + Pole Placement","Feedback Linearization + LQR"...
    ,"Second Order Sliding Mode Control", "Adaptive Sliding Mode Control")
title("Right propeller angular velocity [rad/s]","FontWeight","normal","FontSize",15);
set(gca, 'FontSize', 12);