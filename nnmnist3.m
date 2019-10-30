clc;
DAT=load('train.txt');
m=35000;
%rand_indices = randperm(35000);
X=DAT(:,2:785);
y=DAT(:,1);
for i=1:m
    if y(i)==0
        y(i)=10;
    end
end
XNEW= X(1:35000,1:784);
XNEW=XNEW/255;
n=785;o=100;p=100;
x=ones(m,1);
blayer=rand(m,o);
blayer=[x blayer];
BLAYER=rand(m,o);
BLAYER=[x BLAYER];
clayer=rand(m,p);
clayer=[x clayer];
dlayer=rand(m,10);
youtput=zeros(m,10);
for i=1:m
   youtput(i,y(i))=1;    
end
thetabA=rand(n,o+1)-0.5;
thetaBb=rand(o+1,o+1)-0.5;
thetaCB=rand(o+1,p+1)-0.5;
thetaDC=rand(p+1,10)-0.5;
    alayer=[x XNEW];
alpha=0.00001;
i=1;
c=zeros(30000,1);
while i<1500
blayer=1./(1+exp(-alayer*thetabA));
BLAYER=1./(1+exp(-blayer*thetaBb));
clayer=1./(1+exp(-BLAYER*thetaCB));
dlayer=1./(1+exp(-clayer*thetaDC));

deltajd=dlayer-youtput;
thetaDC=thetaDC-alpha*clayer'*deltajd;

deltajc=(deltajd*thetaDC').*(clayer.*(1-clayer));%%%clayer-
thetaCB=thetaCB-alpha*BLAYER'*deltajc;

deltajB=(deltajc*thetaCB').*(BLAYER.*(1-BLAYER));%%%clayer-
thetaBb=thetaBb-alpha*blayer'*deltajB;

deltajb=(deltajB*thetaBb').*(blayer.*(1-blayer));%%%blayer-
%thetaDC=thetaDC-alpha*clayer'*deltajd;
%thetaCB=thetaCB-alpha*blayer'*deltajc;
thetabA=thetabA-alpha*alayer'*deltajb;
for j=1:m
    index=find(youtput(j,:)==max(youtput(j,:)));
    index1=find(dlayer(j,:)==max(dlayer(j,:)));
    if index==index1
        c(i)=c(i)+1;
    end
end
c(i)/350
%%%%%%%%%%%%%%%%%%%%5
%if c(i)>32004
 %  break;
%end
%%%%%%%%%%%%%%%%%
i=i+1
end
k=1:1500;
d=c(1:1500,1);
plot(k,d/350)