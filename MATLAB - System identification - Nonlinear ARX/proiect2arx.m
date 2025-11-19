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
%% na=nb=1, m arbitrar
% m=2;
% mlen=(m+1)*(m+2)/2;
% phi_id=zeros(Nid,mlen);
% for k=1:Nid
%     if k-1>0
%         x1=yid(k-1);
%         x2=uid(k-1);
%     else
%         x1=0;
%         x2=0;
%     end
%     phi_id(k,:)=generateLine(x1,x2,m);
%        
%     
% end
% theta=phi_id\yid;
% phi_val=zeros(Nval,mlen);
% 
% for k=1:Nval
%     if k-1>0
%         x1=yval(k-1);
%         x2=uval(k-1);
%     else
%         x1=0;
%         x2=0;
%     end
%     phi_val(k,:)=generateLine(x1,x2,m);
% end
% 
% yhatval_pred=phi_val*theta;
% figure()
% plot(tval,yval,tval,yhatval_pred)
% legend("yval","yhatval")
% title("prediction na=nb=1")
% % 
% % yhat=phi*theta;
% % plot(yid)
% % hold on;
% % plot(yhat)
% 
% 
% 
% % mse=0;
% % for i=1:Nid
% %    mse=mse+(yid(i)-yhat(i))^2 ;
% % end
% % mse=mse/Nid;
% % mse1=mean((yid-yhat).^2);
%% na,nb arbitrar m = 2

% % m=2;
% na=5;
% nb=5;
% N=na+nb;
% 
% 
% Xid=zeros(Nid,na+nb);
% for k=1:Nid
%     for i=1:na
%         if k-i>0
%             Xid(k,i)=yid(k-i);%yid
%         end
%     end
%     
%     for i=na+1:na+nb
%         if k-i+na>0
%             Xid(k,i)=uid(k-i+na);%uid
%         end
%     end
% end
% 
% 
% 
% 
% phi_id=zeros(Nid,1+N+N+N*(N-1)/2);
% phi_id(:,1)=1;
% phi_id(:,2:N+1)=Xid;
% phi_id(:,N+2:2*N+1)=Xid.^2;
% % phi(:,2*N+2:end)=
% 
% k=0;
% for i=1:N-1
%    for j=i+1:N
%          phi_id(:,2*N+2+k)=Xid(:,i).*Xid(:,j);
%          k=k+1;
%    end
%     
% end
% theta=phi_id\yid;
% 
% 
% Xval=zeros(Nval,na+nb);
% for k=1:Nval
%     for i=1:na
%         if k-i>0
%             Xval(k,i)=yval(k-i);%yval
%         end
%     end
%     
%     for i=na+1:na+nb
%         if k-i+na>0
%             Xval(k,i)=uval(k-i+na);%uval
%         end
%     end
% end
% 
% phi_val=zeros(Nval,1+N+N+N*(N-1)/2);
% phi_val(:,1)=1;
% phi_val(:,2:N+1)=Xval;
% phi_val(:,N+2:2*N+1)=Xval.^2;
% 
% k=0;
% for i=1:N-1
%    for j=i+1:N
%          phi_val(:,2*N+2+k)=Xval(:,i).*Xval(:,j);
%          k=k+1;
%    end
%     
% end
% 
% 
% yhatval_pred=phi_val*theta;
% figure()
% plot(tval,yval,tval,yhatval_pred)
% legend("yval","yhatval")
% title("prediction na=nb=random, m=2")
% 


%% all out

m=4; %1
na=2;%3
nb=2;%3
nk=1;
N=na+nb;




%predictie
% id
Xid=zeros(Nid,na+nb);
for k=1:Nid
    for i=1:na
        if k-i>0
            Xid(k,i)=yid(k-i);%yid
        end
    end
    
    for i=na+1:na+nb
        if k-i+na-nk+1>0
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

figure()
plot(tid,yid)
hold on;
plot(tid,yhatid_pred);
hold off;
legend("$y_{id}$","$\hat{y}_{id}$",'fontsize',14,'interpreter','Latex','Location','southeast')
legend('boxoff')
title(['pred','  MSEid=',num2str(mse_id_pred)])

%val
Xval=zeros(Nval,na+nb);
for k=1:Nval
    for i=1:na
        if k-i>0
            Xval(k,i)=yval(k-i);%yval
        end
    end
    
    for i=na+1:na+nb
        if k-i+na-nk+1>0
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

figure()
plot(tval,yval)
hold on;
plot(tval,yhatval_pred);
hold off;
legend("$y_{val}$","$\hat{y}_{val}$",'fontsize',14,'interpreter','Latex','Location','southeast')
legend('boxoff')
title(['pred','  MSEval=',num2str(mse_val_pred)])

%% simulare

yhatid_sim=zeros(1,Nid);
yhatval_sim=zeros(1,Nval);

%id
Xids=zeros(Nid,na+nb);
for k=1:Nid
    for i=1:na
        if k-i>0
            Xids(k,i)=yhatid_sim(k-i);
        end
    end
    
    for i=na+1:na+nb
        if k-i+na-nk+1>0
            Xids(k,i)=uid(k-i+na-nk+1);%uid
        end
    end
    yhatid_sim(k)=generate_generalized_v1(Xids(k,:),m)*theta;
    
end

mse_id_sim=mean((yid-yhatid_sim').^2);

figure()
plot(tid,yid)
hold on;
plot(tid,yhatid_sim);
% ylim([min(yid)-100,max(yid)+100])
hold off;
legend("$y_{id}$","$\hat{y}_{id}$",'fontsize',14,'interpreter','Latex','Location','southeast')
legend('boxoff')
title(['sim','  MSEid=',num2str(mse_id_sim)])

%val
Xvals=zeros(Nval,na+nb);
for k=1:Nval
    for i=1:na
        if k-i>0
            Xvals(k,i)=yhatval_sim(k-i);
        end
    end
    
    for i=na+1:na+nb
        if k-i+na-nk+1>0
            Xvals(k,i)=uval(k-i+na-nk+1);%uval
        end
    end
    yhatval_sim(k)=generate_generalized_v1(Xvals(k,:),m)*theta;
    
end

mse_val_sim=mean((yval-yhatval_sim').^2);

figure()
plot(tval,yval)
hold on;
plot(tval,yhatval_sim);
% ylim([min(yval)-100,max(yval)+100])
hold off;
legend("$y_{val}$","$\hat{y}_{val}$",'fontsize',14,'interpreter','Latex','Location','southeast')
legend('boxoff')
title(['sim','  MSEval=',num2str(mse_val_sim)])