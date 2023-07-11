function r = f_roa2D()
% strats from the origin i.e the center of the meshgrid
% layer by layer and checks if Vdot is negative;
% it stops on the first layer that has a negative value for Vdot;
% to check this condition we compute Vdot of all the elements in
% the current layer, we go through each of them and check whether it is 
% positive or negative;
% finally, r is given by the number of layers that have negative values
% only times the value of the step i.e. the distance between 2 layers

range = 5;
step=0.01;
len=length(-range:step:range);
[x1,x2]=meshgrid(linspace(-range,range,len));

v=@(x,y)1.5*x.^2+y.^2+x.*y;%v
vdot=@(x,y)-x.^2-y.^2+x.*y.^3+4*y.^4-1/4*x.*y.^5-1/2*y.^6;%vdot

Vs= arrayfun(v, x1, x2);
Vdots = arrayfun(vdot, x1, x2);
for k=1:ceil(len/2)
    stop=0;
    [lu,ru,ld,rd]=f_layers(k,x1,x2);
    layer_vals=[];
    for p=lu{1}:ru{1}
        layer_vals=[layer_vals,Vdots(p,lu{2})];
    end

    for p=ru{2}+1:rd{2}
        layer_vals=[layer_vals,Vdots(ru{1},p)];
    end

    for p=rd{1}-1:-1:ld{1}
        layer_vals=[layer_vals,Vdots(p,rd{2})];
    end

    for p=ld{2}-1:-1:lu{2}+1
        layer_vals=[layer_vals,Vdots(ld{1},p)];
    end

    for i=1:length(layer_vals)
        if layer_vals(i)>0
            stop=1;
            break
        end
    end
    if stop==1
        r=k*step;
        break;
    end
    
end

    function [lu,ru,ld,rd]=f_layers(layer_index,x1,x2)
        % generates coordinates for the four corners of a layer
        % we define a layer by its index
        % index 0 is the center of the meshgrid
        % index 1 is the layer surounding the center - the 3 by 3 matrix 
        % and so on towards the exterior of the meshgrid
        % lu - left up corner
        % ru - right up corner
        % ld - left down corner
        % rd - right down corner
        len1=length(x1);
        len2=length(x2);
        center_x=ceil(len1/2);
        center_y=ceil(len2/2);
        if layer_index<0
            return
        elseif layer_index==0 
            lu={center_x,center_y};
            ru={center_x,center_y};
            ld={center_x,center_y};
            rd={center_x,center_y};
        elseif layer_index>min(center_x,center_y)
            return
        else
            lu={center_x-layer_index,center_y-layer_index};
            ru={center_x+layer_index,center_y-layer_index};
            ld={center_x-layer_index,center_y+layer_index};
            rd={center_x+layer_index,center_y+layer_index};
        end
    end
end

