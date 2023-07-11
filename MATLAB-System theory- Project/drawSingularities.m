p1=plot(-0.2,4.2379,'ro','MarkerSize',8);grid
hold on
plot(-0.2,-4.2379,'ro','MarkerSize',8)
p2=plot(-30,0,'bo','MarkerSize',8);
xlim([-35 10])
ylim([-10 10])
plot(-100:100,1,'k')
xline(0,'LineWidth',2)
yline(0,'LineWidth',2)
p3=plot(-0.44984,5.67899,'mx','MarkerSize',15);
plot(-0.44984,-5.67899,'mx','MarkerSize',15)


plot(-0.00015,2.35508,'mx','MarkerSize',15)
plot(-0.00015,-2.35508,'mx','MarkerSize',15)
legend([p1 p2 p3],'H_1(s) zerouri','H_2(s) zero','poli')
legend('Location','eastoutside')
title("Reprezentarea singularităților în planul complex")
xlabel('X');
ylabel('jY');