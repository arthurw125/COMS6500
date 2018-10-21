function [f,dfx,dfy] = f_x(x0,y0,C)
% returns function and derivative at point x
f = x0^2 + y0^2 - C;
dfx = 2*x0;
dfy = 2*y0;
%f = x0^2-4*sin(x0);
%df = 2*x0-4*cos(x0);
end