clear
clc
load('ex3data1.mat');
rand_indices=randperm(5000);
m=3500;
x=ones(1,m);
XNEW=X(rand_indices(1:m),:);
alayer1=XNEW';
alayer=[x;alayer1];
x=ones(1,m);
blayer1=zeros(16,m);
blayer=[x;blayer1];
clayer1=zeros(16,m);
clayer=[x;clayer1];
dlayer=zeros(10,m);
youtput=zeros(10,m);
for i=1:m
   youtput(y(rand_indices(i)),i)=1;    
end

thetaBA=rand(17,401)*(2*0.5)-0.5;
thetaCB=rand(17,17)*(2*0.5)-0.5;
thetaDC=rand(10,17)*(2*0.5)-0.5;
alpha=0.0001/5;
iteration=0;
for i=1:50000
blayer=1./(1+exp(-thetaBA*alayer));
clayer=1./(1+exp(-thetaCB*blayer));
dlayer=1./(1+exp(-thetaDC*clayer));

thetaDC=thetaDC-alpha*(dlayer-youtput)*(clayer)';

deltaC=(thetaDC)'*(dlayer-youtput).*(clayer.*(1-clayer));
clayer=clayer-deltaC;
thetaCB=thetaCB-alpha*(deltaC)*(blayer)';

deltaB=(thetaCB)'*(deltaC).*(blayer.*(1-blayer));
blayer=blayer-deltaB;
thetaBA=thetaBA-alpha*(deltaB)*(alayer)';

iteration=iteration+1

end



