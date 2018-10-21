%Get the values of the parameters
a=0; b=2*pi;
N=20;

%Get the x-values
x=linspace(a,b,N);


%Get the ufnction and their derivatives
f=sin(x);
df1=cos(x);
df2=-1*sin(x);

fprintf("............................................\n");
disp('f(x)                   df1(x)            df2(x)');
fprintf(".............................................\n");
fprintf("%10.5g\t\t %10.5g\t\t %10.5g\n", f, df1, df2);

figure;
plot(x,f, 'r');
hold on
plot(x,df1, 'b');
hold on
plot(x,df2, 'g');
xlabel('x');
ylabel('y');
%ylim([-1,1])
title('Sine with its True deriavtives');
legend("f", "f^\prime", "f^{\prime\prime}");