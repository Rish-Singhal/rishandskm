clear
clc
theta0=0;
theta1=0;
Jtheta0=0;
Jtheta1=0;
alpha=0.0001;
P=load('ex1data1.txt');
X=P(:,1);
Y=P(:,2);
E=1;
x=ones(97,1);
X1=[x X];
theta=(inv(X1'*X1))*X1'*Y
iter=0;
E=1;
for j=1:50000
    Jtheta0=0;
    Jtheta1=0;
    for i=1:97
        htheta=theta0+theta1*X(i);
        Jtheta0=Jtheta0+(htheta-Y(i));
        Jtheta1=Jtheta1+((htheta-Y(i))*X(i));
    end
    theta0=theta0-(alpha*Jtheta0);
    theta1=theta1-(alpha*Jtheta1);
    %J=(theta0+theta1*X(j)-Y(j));
    %E=J*J;
    iter=iter+1;
end
disp(theta0);
disp(theta1);
