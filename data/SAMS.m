% SAMS算法，curve_t，curve_opt画收敛曲线用，分别是系数没优化和优化后的收敛曲线

function [Sams,curve_t,curve_opt]=SAMS(a,b,W)
N=10000; % 迭代次数
m=100; % beta的个数
pai=ones(1,m)/m; % 平稳分布
zeta=zeros(1,m);
v=zeros(1,length(b)); % 初始化v
Beta=linspace(0,1,m); % beta均匀分布

beta=Beta(m); % 初始化beta
log_q_v=zeros(1,m);
[v,h]=gibbs_sampling(v,beta,a,b,a,b,W); % gibbs采样v
curve_t=zeros(1,N);

%% logZ1
logZ1=0;
for j=1:length(a)
    logZ1=logZ1+log(1+exp(a(j)));
end
for i=1:length(b)
    logZ1=logZ1+log(1+exp(b(i)));
end



%% zeta_opt 系数优化后的
curve_opt=zeros(1,N);
t0=0.5*N;
alpha=0.6;

for t=1:N    
    for i=1:m
    log_q_v(i)=log_Pk(v,Beta(i),a,b,a,b,W);
    end
    log_p_L_v=log_q_v-zeta;
    p_L_v=exp(log_p_L_v-mean(log_p_L_v));
    S=sum(p_L_v);
    p_L_v_norm=p_L_v/S;%归一化概率
    
    % 系数优化
    if t<=t0
        zeta_temp=zeta+ones(1,m).*min(pai,t^(-alpha)).*p_L_v_norm./pai;
    else
        zeta_temp=zeta+ones(1,m).*min(pai,(t-t0+t0^alpha)^(-1)).*p_L_v_norm./pai;
    end

    zeta_now=zeta_temp-zeta_temp(1);
    
    log_p_L_v_now=log_q_v-zeta_now;
    p_L_v_now=exp(log_p_L_v_now-mean(log_p_L_v_now));
    S_now=sum(p_L_v_now);  
    p_L_v_now_norm=p_L_v_now/S_now; %新的归一化概率
   
    % 利用新的归一化概率生成β
    p=rand;
    k=find(p<=cumsum(p_L_v_now_norm));
    beta=Beta(k(1));
    
    [v_new,h]=gibbs_sampling(v,beta,a,b,a,b,W);% 采样新的 v
    v=v_new;
    zeta=zeta_now;
%     curve_opt(t)=logZ1+zeta(m); % 画收敛曲线用
end
Sams=zeta(m)+logZ1

%% zeta_t 系数没有优化的
% zeta=zeros(1,m);
% v=zeros(1,length(b));
% Beta=linspace(0,1,m);
% % beta=Beta(randi(100));
% beta=Beta(m);
% log_q_v=zeros(1,m);
% [v,h]=gibbs_sampling(v,beta,a,b,a,b,W);
% 
% for t=1:N    
%     for i=1:m
%     log_q_v(i)=log_Pk(v,Beta(i),a,b,a,b,W);
%     end
%     log_p_L_v=log_q_v-zeta;
%     p_L_v=exp(log_p_L_v-mean(log_p_L_v));
%     S=sum(p_L_v);
%     p_L_v_norm=p_L_v/S;%归一化概率
%     

%     zeta_temp=zeta+ones(1,m)./t.*p_L_v_norm./pai; % 系数没有优化的公式
%     zeta_now=zeta_temp-zeta_temp(1);
%     
%     log_p_L_v_now=log_q_v-zeta_now;
%     p_L_v_now=exp(log_p_L_v_now-mean(log_p_L_v_now));
%     S_now=sum(p_L_v_now);  
%     p_L_v_now_norm=p_L_v_now/S_now;
%    
%         %%生成β
%     p=rand;
%     k=find(p<=cumsum(p_L_v_now_norm));
%     beta=Beta(k(1));
%     
%     [v_new,h]=gibbs_sampling(v,beta,a,b,a,b,W);%new v
%     v=v_new;
%     zeta=zeta_now;
%     curve_t(t)=logZ1+zeta(m);
% end


% plot(curve);
    