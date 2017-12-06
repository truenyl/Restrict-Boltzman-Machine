clear all;
close all;

mu=[5 10];
sigma=[1 1;1 4];

x=[unifrnd(0,10) unifrnd(0,20)];
wave=zeros(2,100000);
curve=zeros(1,length(wave));
wave(:,1)=x';

for i=2:length(wave)
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
    cov=corrcoef(wave(1,1:i)',wave(2,1:i)');
    curve(i)=cov(1,2);
end
figure;
plot(curve(1:0.3*length(wave)),'r');
hold on;
cov(1,2)

x=[unifrnd(0,10) unifrnd(0,20)];
wave=zeros(2,100000);
curve=zeros(1,length(wave));
wave(:,1)=x';

for i=2:length(wave)
    f=mvnpdf(x,mu,sigma);
    y=[unifrnd(0,10) unifrnd(0,20)];
%     y=[normrnd(x(1),1) normrnd(x(2),2)];
    f_new=mvnpdf(y,mu,sigma);
    alfa=f_new/f;
    r=rand;
    if r<alfa
        x=y;
    end
    wave(:,i)=x';
    cov=corrcoef(wave(1,1:i)',wave(2,1:i)');
    curve(i)=cov(1,2);
end
plot(curve(1:0.3*length(wave)),'b');
cov(1,2)

title('不同f(x)下的相关系数收敛曲线');
legend('正态分布','均匀分布');
xlabel('迭代次数');
ylabel('相关系数');

    

