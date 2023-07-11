function  [mseref,bestf] = bestfriend2(dataarray,maxpole)
n=numel(dataarray);
mseref=100;

for i=1:n
    dataid=dataarray{i};
    for j=1:maxpole
        %%tfest
        for na=1:j
            mdl=arx(dataid,[[na*ones(2,2), maxpole*ones(2,2), ones(2,2)]]);
%             p=pole(tf(mdl));
%             if (length(find(real(p)~=1))<1)
%                 continue
%             end
            msemean1=0;
            msemean2=0;
            for k=1:n
                [mse1,mse2]=model_valf(mdl,dataarray{k});
                msemean1=msemean1+mse1;
                msemean2=msemean2+mse2;
            end
            msemean1=msemean1/n;
            msemean2=msemean2/n;
            msemean=(msemean1+msemean2)/2;

            if msemean<mseref
                mseref=msemean;
                bestf=mdl;
            end
        end
        
    end
    
end

end

