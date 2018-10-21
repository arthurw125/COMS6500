function [f,dfx,dfy] = f_x2(x0,y0,C)
% returns function and derivative at point x

syms f(X,Y)
f(X,Y) = 3*(1-X).^2*exp(-(X.^2)-(Y+1).^2)-10*(X/5-X.^3-Y.^5)*exp(-X.^2-Y.^2)-(1/3)*exp(-(X+1).^2-Y.^2);

dfx = diff(f,X)
dfy = diff(f,Y)
X=x0;Y=y0;
f = f(X,Y)
dfx1 = dfx(X,Y)
dfy1 = dfy(X,Y);
%f = x0^2-4*sin(x0);
%df = 2*x0-4*cos(x0);
end