function [x_sol,y_sol,err_sol] = Newton(x0,y0,tol,N,C)
% Newton method for solving a nonlinear equation
x = x0;
y = y0;
err1 = 3*tol;
err_vect = [];
err_vect1 = [];
sol_vect_x = [];
sol_vect_y = [];
i_vect = [];
f_vect = [];
i = 0;
while err1 > tol && i < N
    [f,dfx,dfy] = f_x(x,y,C);
%     z = f/dfx;
    z = f/dfx;
    %z1 = f/dfy;
    %err = abs(z);
    %err1 = abs(z1);
    
    x = x - z; % solution
    [f,dfx,dfy] = f_x(x,y,C);
    z1 = f/dfy;
    err1 = abs(z1);
    y = y - z1;
    %err_vect = [err_vect,err];
    err_vect1 = [err_vect1,err1];
    
    i_vect = [i_vect,i];
    sol_vect_x = [sol_vect_x,x];
    sol_vect_y = [sol_vect_y,y];
%     sol_vect1 = [sol_vect1,y];
    f_vect = [f_vect,f];
    i = i + 1;
end
x_sol = x;
y_sol = y;
err_sol = err1;

% T = table(i_vect(:), sol_vect_x(:), sol_vect_y(:), err_vect1(:), f_vect(:));
% T.Properties.VariableNames = {'i' 'xi' 'yi' 'error' 'f_xi'};
% format long;
% disp(T);
% figure;
% plot(err_vect1,'Marker','o')
% title('Newton Method Error')
% xlabel('Iteration Step')
% ylabel('Error')
end