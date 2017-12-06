% %
% �������ʵ����AIS�㷨����Ϊ����ĵ�������
% curve_ais �����������ã����ƹ�һ������ʱ����

function [Ais,curve_ais]=AIS(a,b,W,N)

% Bģ�Ͳ���
aB=a;
bB=b;
WB=W;

% Aģ�Ͳ�����WΪ0
aA=a;
bA=b;

% beta�Ĳ���
Beta=linspace(0,1,N);

curve_ais=zeros(1,N);

% ǰ����ܵ�beta
% Beta1=linspace(0,0.5,N/8);
% Beta2=linspace(0.5,0.75,N/4);
% Beta3=linspace(0.75,1,5*N/8);
% Beta=[Beta1 Beta2 Beta3];
%

    logZA=0;
    for j=1:length(aA)
        logZA=logZA+log(1+exp(aA(j)));
    end
    for i=1:length(bA)
        logZA=logZA+log(1+exp(bA(i)));
    end

    v=(1./(1+exp(-bA))) > rand(1,length(bA));% ����PA�ķֲ����ɵ�һ��v

    logZ=logZA;% ��ʼ����logZ
 
    for i=2:N
        log_Pk_star=log_Pk(v,Beta(i),aA,bA,aB,bB,WB);% Pkȡ����
        log_Pk_1_star=log_Pk(v,Beta(i-1),aA,bA,aB,bB,WB);% Pk-1ȡ����
        [v_new,h]=gibbs_sampling(v,Beta(i),aA,bA,aB,bB,WB);% ���е�v����˹���������µ�v
        v=v_new;
        logZ=logZ+log_Pk_star-log_Pk_1_star;  
        curve_ais(i)=logZ;
    end

Ais=logZ;
% plot(curve_ais); % ��ͼ��
