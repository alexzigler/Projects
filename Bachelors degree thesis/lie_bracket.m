function mat = lie_bracket(x,f,g,ord)
    % this function calculates all the lie bracket [f,g] vector fields starting
    % from order 0, up to order "ord" and places them by column in the matrix mat
        mat(:,1)=g;
        for i=1:ord
            mat(:,i+1)=jacobian(mat(:,i),x)*f-jacobian(f,x)*mat(:,i);
        end
end