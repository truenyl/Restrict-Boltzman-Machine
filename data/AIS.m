% %
% 这个函数实现了AIS算法，Ｎ为输入的迭代次数
% curve_ais 画收敛曲线用，估计归一化常数时不用

function [Ais,curve_ais]=AIS(a,b,W,N)

% B模型参数
aB=a;
bB=b;
WB=W;

% A模型参数，W为0
aA=a;
bA=b;

% beta的步长
Beta=linspace(0,1,N);

curve_ais=zeros(1,N);

% 前疏后密的beta
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

    v=(1./(1+exp(-bA))) > rand(1,length(bA));% 按照PA的分布生成第一个v

    logZ=logZA;% 开始计算logZ
 
    for i=2:N
        log_Pk_star=log_Pk(v,Beta(i),aA,bA,aB,bB,WB);% Pk取对数
        log_Pk_1_star=log_Pk(v,Beta(i-1),aA,bA,aB,bB,WB);% Pk-1取对数
        [v_new,h]=gibbs_sampling(v,Beta(i),aA,bA,aB,bB,WB);% 现有的v吉布斯采样生成新的v
        v=v_new;
        logZ=logZ+log_Pk_star-log_Pk_1_star;  
        curve_ais(i)=logZ;
    end

Ais=logZ;
% plot(curve_ais); % 画图用
