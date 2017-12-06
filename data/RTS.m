% ecu为精度要求，curve_rts为画收敛曲线用

function [Rts,curve_rts]=RTS(a,b,W,ecu)
K=100; % beta的个数
Beta=linspace(0,1,K); % 均匀生成beta
logZ=zeros(1,K);
c=zeros(1,K);
x=sigm(b)>rand(1,length(b)); % 初始化x
position=randi(K,1);
beta=Beta(position); % 初始化beta

r=1/K*ones(1,K); % 设置平稳分布
N=50;
% M=2000;

% t=0;

% 计算logZ
for j=1:length(a)
    logZ=logZ+log(1+exp(a(j)));
end
for i=1:length(b)
    logZ=logZ+log(1+exp(b(i)));
end

ite=0; % 程序运行的时候显示进度

curve_rts=logZ(K); % 画图用

while(true)
    ite=ite+1
    for t=1:N
        [x_new,h]=gibbs_sampling(x,beta,a,b,a,b,W); % 生成新的x
        x=x_new;
        
        for i=1:K
            log_Fk(i)=log_Pk(x,Beta(i),a,b,a,b,W); % 算fk
        end
    
        log_q_beta_x=log_Fk-logZ;
        q_beta_x=exp(log_q_beta_x-mean(log_q_beta_x));
        S=sum(q_beta_x);
        q_beta_x_norm=q_beta_x/S; % 归一化的beta的条件分布

        c=c+1/N*q_beta_x_norm; % 更新c
    
        p=rand;
        k=find(p<cumsum(q_beta_x_norm));
        beta=Beta(k(1)); % 生成新的beta
    
    end
    
    c=c/sum(c);
    logZ=logZ+log(c)-log(c(1)); % 更新logZ
    
    if(max(abs(r-c))<ecu && ite>600)
        % 设置阈值跳出循环，ite>600是为了画图，使用RTS进行归一化估计的时候可以设置较小的值
        break;
    end
    
    curve_rts=[curve_rts logZ(K)]; % 画图用
%     c=zeros(1,K);
end


logZ(K)
Rts=logZ;
% plot(curve_rts);
