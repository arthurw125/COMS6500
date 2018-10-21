function [dxx]= Dxx(a,b,N)
%Get the size of th ematrix

Dxx =zeros(N,N);

%Get the tridiagonal matrix
for i=1:N  
  Dxx(i,i) =2;  
end

for i=1:N-1
    Dxx(i,i+1)=-1;
    Dxx(i+1,i)=-1;
end
%Dxx


%Get the discretized step
h=(b-a)/(N-1);
dxx=(1/h.^2)*Dxx;
% disp(h)
% disp(1/h^2)
% disp(Dxx);
disp(dxx);
end