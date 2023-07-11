function  [mseref,bestf] = bestfriend1(dataarray,maxpole)
n=numel(dataarray);
mseref=100;

for i=1:n
    dataid=dataarray{i};
    for j=1:maxpole
            Ho=tfest(dataid,j);
            P=4.9395;
            I=0.0023;
            D=5.188;
            N=100;
            Hr=tf([D,P,I],[1 0]);
%             Hr=tf([D*N+P,I+P*N,I*N],[1 N 0]);

            Hf=minreal(series(1/Hr,Ho/(1-Ho)));
            

            msemean=0;
            for k=1:n
                mse=val_closed(Hf,dataarray{k});
                msemean=msemean+mse;
            end
            msemean=msemean/n;
            if msemean<mseref
                mseref=msemean;
                bestf=Hf;
            end
        
    end
    
end

end

