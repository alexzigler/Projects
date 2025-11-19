data=out.logsout;
N_x=data.get("N_x").Values.Data;
L_x=data.get("L_x").Values.Data;
H_x=data.get("H_x").Values.Data;
N_y=data.get("N_y").Values.Data;
L_y=data.get("L_y").Values.Data;
H_y=data.get("H_y").Values.Data;
N_z=data.get("N_z").Values.Data;
L_z=data.get("L_z").Values.Data;
H_z=data.get("H_z").Values.Data;
N_phi=data.get("N_phi").Values.Data;
L_phi=data.get("L_phi").Values.Data;
H_phi=data.get("H_phi").Values.Data;
N_theta=data.get("N_theta").Values.Data;
L_theta=data.get("L_theta").Values.Data;
H_theta=data.get("H_theta").Values.Data;
N_psi=data.get("N_psi").Values.Data;
L_psi=data.get("L_psi").Values.Data;
H_psi=data.get("H_psi").Values.Data;
timex=data.get("N_z").Values.Time;

tiledlayout(3,2)
newton_lw=3;
lagrange_lw=1.5;
hamilton_lw=1;

ax1=nexttile;
plot(timex, N_x, 'Color', [1, 0.7, 0], 'LineStyle', '-','LineWidth',newton_lw)
hold on
plot(timex, L_x, 'Color', 'b', 'LineStyle', '-.','LineWidth',lagrange_lw)
plot(timex, H_x, 'Color', 'r', 'LineStyle', '--','LineWidth',hamilton_lw)
xlabel("Time [sec]")
leg1=legend("Newton","Lagrange","Hamilton");
grid
title("x [meters]","FontWeight","normal","FontSize",15)
set(leg1, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax2=nexttile;
plot(timex, N_phi, 'Color', [1, 0.7, 0], 'LineStyle', '-','LineWidth',newton_lw)
hold on
plot(timex, L_phi, 'Color', 'b', 'LineStyle', ':','LineWidth',lagrange_lw)
plot(timex, H_phi, 'Color', 'r', 'LineStyle', '--','LineWidth',hamilton_lw)
xlabel("Time [sec]")
leg2=legend("Newton","Lagrange","Hamilton");
grid
title("$\phi$ [rad]",'interpreter',"latex","FontSize",15)
set(leg2, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax3=nexttile;
plot(timex, N_y, 'Color', [1, 0.7, 0], 'LineStyle', '-','LineWidth',newton_lw)
hold on
plot(timex, L_y, 'Color', 'b', 'LineStyle', '-.','LineWidth',lagrange_lw)
plot(timex, H_y, 'Color', 'r', 'LineStyle', '--','LineWidth',hamilton_lw)
xlabel("Time [sec]")
leg3=legend("Newton","Lagrange","Hamilton");
grid
title("y [meters]","FontWeight","normal","FontSize",15)
set(leg3, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax4=nexttile;
plot(timex, N_theta, 'Color', [1, 0.7, 0], 'LineStyle', '-','LineWidth',newton_lw)
hold on
plot(timex, L_theta, 'Color', 'b', 'LineStyle', ':','LineWidth',lagrange_lw)
plot(timex, H_theta, 'Color', 'r', 'LineStyle', '--','LineWidth',hamilton_lw)
xlabel("Time [sec]")
leg4=legend("Newton","Lagrange","Hamilton");
grid
title("$\theta$ [rad]",'interpreter',"latex","FontSize",15)
set(leg4, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax5=nexttile;
plot(timex, N_z, 'Color', [1, 0.7, 0], 'LineStyle', '-','LineWidth',newton_lw)
hold on
plot(timex, L_z, 'Color', 'b', 'LineStyle', '-.','LineWidth',lagrange_lw)
plot(timex, H_z, 'Color', 'r', 'LineStyle', '--','LineWidth',hamilton_lw)
xlabel("Time [sec]")
leg5=legend("Newton","Lagrange","Hamilton");
grid
title("z [meters]","FontWeight","normal","FontSize",15)
set(leg5, 'FontSize', 8)
set(gca, 'FontSize', 12);

ax6=nexttile;
plot(timex, N_psi, 'Color', [1, 0.7, 0], 'LineStyle', '-','LineWidth',newton_lw)
hold on
plot(timex, L_psi, 'Color', 'b', 'LineStyle', ':','LineWidth',lagrange_lw)
plot(timex, H_psi, 'Color', 'r', 'LineStyle', '--','LineWidth',hamilton_lw)
xlabel("Time [sec]")
leg6=legend("Newton","Lagrange","Hamilton");
grid
title("$\psi$ [rad]",'Interpreter',"latex","FontSize",15)
set(gca, 'FontSize', 12);
set(leg6, 'FontSize', 8)

% linkaxes([ax1, ax2, ax3, ax4, ax5, ax6], 'xy');
f1=gcf;

%%

M_front=data.get("front").Values.Data;
M_back=data.get("back").Values.Data;
M_left=data.get("left").Values.Data;
M_right=data.get("right").Values.Data;
figure 
plot(timex,M_front,"LineWidth",1.5,'LineStyle','-')
hold on
plot(timex,M_back,"LineWidth",1.4,'LineStyle','--')
plot(timex,M_left,"LineWidth",1.4,'LineStyle',':')
plot(timex,M_right,"LineWidth",1.2,'LineStyle','-.')
grid
legend("Front","Back","Left","Right")
title("Vitezele motoarelor [rad/s]")
f2=gcf;
%%
f1.WindowState="maximized";
f2.WindowState="maximized";
exportgraphics(f1,'states.png','Resolution',600)
exportgraphics(f2,'motor_speeds.png','Resolution',600)