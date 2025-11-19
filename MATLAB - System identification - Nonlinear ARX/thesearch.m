clear
load('iddata-09.mat')
uid=id.u;
yid=id.y;

uval=val.u;
yval=val.y;

Nid=length(yid);
Nval=length(yval);

tid=0:id.Ts:(Nid-1)*id.Ts;
tval=0:val.Ts:(Nval-1)*val.Ts;

nabmax=3;
m_max=4;
nk=1;

mse_matrix_pred_id=zeros(m_max,nabmax); %m down, na=nb right
mse_matrix_pred_val=zeros(m_max,nabmax); %m down, na=nb right

mse_matrix_sim_id=zeros(m_max,nabmax); %m down, na=nb right
mse_matrix_sim_val=zeros(m_max,nabmax); %m down, na=nb right
for m=1:m_max
    for  nab=1:nabmax

na=nab;
nb=nab;
N=na+nb;

%id
Xid=zeros(Nid,na+nb);
for k=1:Nid
    for i=1:na
        if k-i>0
            Xid(k,i)=yid(k-i);%yid
        end
    end
    
    for i=na+1:na+nb
        if k-i+na>0
            Xid(k,i)=uid(k-i+na-nk+1);%uid
        end
    end
end
phi_id=[];

for k=1:Nid
    phi_id(k,:)=generate_generalized_v1(Xid(k,:),m);
end
theta=phi_id\yid;
yhatid_pred=phi_id*theta;

mse_id_pred=mean((yid-yhatid_pred).^2);
mse_matrix_pred_id(m,nab)=mse_id_pred;

% figure()
% plot(tid,yid)
% hold on;
% plot(tid,yhatid_pred);
% hold off;
% legend("$y_{id}$","$\hat{y}_{id}$",'fontsize',14,'interpreter','Latex','Location','southeast')
% legend('boxoff')
% title(['pred','  MSEid=',num2str(mse_id_pred)])

%val
Xval=zeros(Nval,na+nb);
for k=1:Nval
    for i=1:na
        if k-i>0
            Xval(k,i)=yval(k-i);%yval
        end
    end
    
    for i=na+1:na+nb
        if k-i+na>0
            Xval(k,i)=uval(k-i+na-nk+1);%uval
        end
    end
end
phi_val=[];
for k=1:Nval
    phi_val(k,:)=generate_generalized_v1(Xval(k,:),m);
end

yhatval_pred=phi_val*theta;

mse_val_pred=mean((yval-yhatval_pred).^2);
mse_matrix_pred_val(m,nab)=mse_val_pred;

% figure()
% plot(tval,yval)
% hold on;
% plot(tval,yhatval_pred);
% hold off;
% legend("$y_{val}$","$\hat{y}_{val}$",'fontsize',14,'interpreter','Latex','Location','southeast')
% legend('boxoff')
% title(['pred','  MSEval=',num2str(mse_val_pred)])

%sim

yhatid_sim=zeros(Nid,1);
yhatval_sim=zeros(Nval,1);

%id
Xids=zeros(Nid,na+nb);
for k=1:Nid
    for i=1:na
        if k-i>0
            Xids(k,i)=yhatid_sim(k-i);
        end
    end
    
    for i=na+1:na+nb
        if k-i+na>0
            Xids(k,i)=uid(k-i+na-nk+1);%uid
        end
    end
    yhatid_sim(k)=generate_generalized_v1(Xids(k,:),m)*theta;
    
end
mse_id_sim=mean((yid-yhatid_sim).^2);
mse_matrix_sim_id(m,nab)=mse_id_sim;

%val
Xvals=zeros(Nval,na+nb);
for k=1:Nval
    for i=1:na
        if k-i>0
            Xvals(k,i)=yhatval_sim(k-i);
        end
    end
    
    for i=na+1:na+nb
        if k-i+na>0
            Xvals(k,i)=uval(k-i+na-nk+1);%uval
        end
    end
    yhatval_sim(k)=generate_generalized_v1(Xvals(k,:),m)*theta;
end   
mse_val_sim=mean((yval-yhatval_sim).^2);
mse_matrix_sim_val(m,nab)=mse_val_sim;
    end
end
%%
%mse_matrix_pred_id
leg=[];
figure

for j=1:nabmax
%        if sum(mse_matrix_pred_id(:,j)>=1)
%            yyaxis right
%            ylabel('mse value')
%        else
%            yyaxis left
%            ylabel('mse value')
%        end
           plot(1:m_max,mse_matrix_pred_id(:,j))
           hold on;
           leg=[leg;['na=nb=',num2str(j)]];
end
legend(leg)
hold off;
title('Prediction id mse graph')
grid
xlabel('m');
ylabel('mse value');

%mse_matrix_pred_val
figure
leg=[];
   for j=1:nabmax
       if sum(mse_matrix_pred_val(:,j)>=1)
           yyaxis right
           ylabel('mse value')
       else
           yyaxis left
           ylabel('mse value')
       end
       plot(1:m_max,mse_matrix_pred_val(:,j))
       hold on;
       leg=[leg;['na=nb=',num2str(j)]];
   end
legend(leg,'Location','west')
hold off;
grid
title('Prediction val mse graph')
xlabel('m');
ylabel('mse value')




%mse_matrix_sim_id
leg=[];
figure

for j=1:nabmax
%        if sum(mse_matrix_sim_id(:,j)>=1)
%            yyaxis right
%            ylabel('mse value')
%        else
%            yyaxis left
%            ylabel('mse value')
%        end
       plot(1:m_max,mse_matrix_sim_id(:,j))
       hold on;
       leg=[leg;['na=nb=',num2str(j)]];
end
legend(leg)
hold off;
title('Simulation id mse graph')
grid
xlabel('m');
ylabel('mse');



%mse_matrix_sim_val
leg=[];
figure

for j=1:nabmax
%        if sum(mse_matrix_sim_val(:,j)>=1)
%            yyaxis right
%            ylabel('mse value')
%        else
%            yyaxis left
%            ylabel('mse value')
%        end
       plot(1:m_max,mse_matrix_sim_val(:,j))
       hold on;
       leg=[leg;['na=nb=',num2str(j)]];
end
legend(leg)
hold off;
title('Simulation val mse graph')
grid
xlabel('m');
ylabel('mse value')
