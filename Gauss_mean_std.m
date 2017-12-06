clear all;
close all;

mu=[5 10];
sigma=[1 1;1 4];
N=5000;
M=20;

x=[unifrnd(0,10) unifrnd(0,20)];
wave=zeros(2,N);
curve=zeros(1,M);
wave(:,1)=x';

for t=1:M
for i=2:N
    f=mvnpdf(x,mu,sigma);
%     y=[unifrnd(0,10) unifrnd(0,20)];
    y=[normrnd(x(1),1) normrnd(x(2),2)];
    f_new=mvnpdf(y,mu,sigma);
    alfa=f_new/f;
    r=rand;
    if r<alfa
        x=y;
    end
    wave(:,i)=x';
%     cov=corrcoef(wave(1,1:i)',wave(2,1:i)');
%     curve(t)=cov(1,2);
end
 cov=corrcoef(wave(1,1:N)',wave(2,1:N)');
curve(t)=cov(1,2);
end
m=mean(curve)
s=std(curve)