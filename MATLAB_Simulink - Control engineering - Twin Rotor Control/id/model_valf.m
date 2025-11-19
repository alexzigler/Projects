function  [mse_azi,mse_pitch] = model_valf(model,valdata)
    [y,~,~]=lsim(model,valdata.u,timeyy(valdata));
    y1=y(:,1);
    y2=y(:,2);
    
    ogy1=valdata.y(:,1);
    ogy2=valdata.y(:,2);
    
    mse_azi=sqr_error(y1,ogy1);
    mse_pitch=sqr_error(y2,ogy2);
    
end

