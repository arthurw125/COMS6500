a = -10;
b = 10;
size = 100;
N = 100;
% x = (b-a).*rand(size,1)+a;
% y = (b-a).*rand(size,1)+a;
% range = [min(r) max(r)]
tol = 1e-6;
x_vect = [];
y_vect = [];
C = 1;
[X,Y] = meshgrid(-2:.1:2);
%[X,Y] = meshgrid(-10:.1:10);
%Z = X.^2 + Y.^2 
Z = 3*(1-X).^2*exp(-(X.^2)-(Y+1).^2)-10*(X/5-X.^3-Y.^5)*exp(-X.^2-Y.^2)-(1/3)*exp(-(X+1).^2-Y.^2);
figure
mesh(X,Y,Z)
hold on
c = ones(length(X),length(Y));
mesh(X,Y,c)
figure
% [ct,h] = contour(X,Y,Z,1:1:6);
[ct,h] = contour(X,Y,Z,[6,-2.5,1,4.5,8]);
clabel(ct,h);


% find level sets using newton method
for C=1:10
    for i=1:length(X)
        for j=1:length(X)
            x0 = X(i,j);
            y0 = Y(i,j);
            [x_sol,y_sol,err] = Newton(x0,y0,tol,N,C);
        %     level_set = [level_set,[x_sol y_sol]];
            x_vect = [x_vect,x_sol];
            y_vect = [y_vect,y_sol];
        end

    end
end
% plot(x_vect,y_vect);
figure
c = linspace(1,10,length(x_vect));
scatter(x_vect,y_vect,[],c,'filled');
% xlim([-2,2])
% ylim([-2,2])
xlim([-10,10])
ylim([-10,10])