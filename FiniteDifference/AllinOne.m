%Get the values of the parameters
a=0; b=2*pi;
N=1000;
x=linspace(a,b,N);
%Calculate the first and second derivatives of sine
dx=Dx(a,b,N);
dxx= Dxx(a,b,N);

f=arrFunc(a,b,N);

%df1=f*dx; 
%df2=f*dxx;
df1=dx*f';
df2=dxx*f';

df1_true =cos(x);
df2_true =-1*sin(x);

% df1_true_vect = zeros(1,N);
% df2_true_vect = zeros(1,N);
myN = [10,20,40,80,160,320,640];
h = (b-a)/(N-1);
% step = 0+ h;
% df1_error = zeros(N,1);
error = [];
error2 = [];
for j=1:length(myN)
    N = myN(j);
    df1_error = zeros(N,1);
    df2_error = zeros(N,1);
    x=linspace(a,b,N);
    df1_true =cos(x);
    df2_true =-1*sin(x);
    f=arrFunc(a,b,N);
    dx=Dx(a,b,N);
    dxx= Dxx(a,b,N);
    df1=dx*f';
    df2=dxx*f';
    df2 = -1.*df2;
    for i=1+1:N-1
    %     df1_error(i) = sqrt(h)*norm(df1_true(i) - df1(i),2);
        df1_error(i) = (df1_true(i) - df1(i))^2;
        df2_error(i) = (df2_true(i) - df2(i))^2;
    %     step = step + h;
    end
    e = log(sum(df1_error)/(N-2));
    e2 = log(sum(df2_error)/(N-2));
    error = [error,e];
    error2 = [error2,e2];
end
% h = (b-a)/(N-1);
% df1_error = sqrt(h)*norm(df1_true - df1,2)
% df1_error = abs(df1_true' - df1);

% f1 = arrFunc(a,b,N1);
N2 = 500;
dx=Dx(a,b,N2);
dxx= Dxx(a,b,N2);
%The x values
x1=linspace(a,b,N2);
B = cos(x1);
%X = linsolve(dx,B'); or 

[L,U] = lu(dx);
y = linsolve(L,B');
X = linsolve(U,y);

Z = linsolve(dxx,B');

% fprintf("............................................\n");
% disp('f(x)                   df1(x)            df2(x)');
% fprintf(".............................................\n");
% fprintf("%10.5g\t\t %10.5g\t\t %10.5g\n", f, df1, df2);
figure;
%plot(df1_error(2:end-1),'r');
subplot(3,1,1)
plot(myN,error,'r')
hold on
plot(myN,error2,'g')
% Plotting the graphs
subplot(3,1,2)
plot(x,f, 'r');
hold on
plot(x,df1, 'b');
hold on
plot(x,df2, 'g');

xlabel('x');
ylabel('y');
ylim([-1,1]);
title('Sine with its Approximate deriavtives');
legend("f", "f^\prime", "f^{\prime\prime}");
% figure;
subplot(3,1,3)
plot(x1,X, 'b');
hold on
plot(x1,Z, 'g');
hold on 
% plot(x1,-1.*df1_true,'r')
xlabel('x');
ylabel('y');
ylim([-2,1]);
% Plotting the graphs
% figure;
% plot(x,f, 'r');
% hold on
% plot(x,df1, 'b');
%hold on
%plot(x,df2, 'g');
% xlabel('x');
% ylabel('y');
% ylim([-1,1]);
% title('Sine with its Approximate deriavtives');
% legend("f", "f^\prime", "f^{\prime\prime}");
% set (gcf, 'Units', 'Normalized', 'OuterPosition', [0,0.1,1,0.9]);
