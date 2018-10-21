function [f]= arrFunc(a,b, N)

%  h=(b-a)/(N-1);
%  x=a:h:N
x=linspace(a,b,N);

f=sin(x);

% fprintf("...............\n");
% disp('x            f(x)');
% fprintf("%g\t\t %g\n", x, f);

plot(x,f);
end