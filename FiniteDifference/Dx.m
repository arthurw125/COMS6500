function [dx]= Dx(a,b,N)
%Get the size of th ematrix

Dx =zeros(N,N);

%Get the tridiagonal matrix
for i=1:N  
  Dx(i,i) =0;  
end

for i=1:N-1
    Dx(i,i+1)=1;
    Dx(i+1,i)=-1;
end

%Get the square of the matrix
s= (Dx).^2; %Finding the element-wise square. 
%Get the discretized matrix

h=(b-a)/(N-1);
%dx=0.5*h *(Dx);
dx=(1/(2*h))*Dx; % changed
s= (dx).^2; %Finding the element-wise square. 

%disp(dx);
disp(s);
end


