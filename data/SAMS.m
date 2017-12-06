% SAMS�㷨��curve_t��curve_opt�����������ã��ֱ���ϵ��û�Ż����Ż������������

function [Sams,curve_t,curve_opt]=SAMS(a,b,W)
N=10000; % ��������
m=100; % beta�ĸ���
pai=ones(1,m)/m; % ƽ�ȷֲ�
zeta=zeros(1,m);
v=zeros(1,length(b)); % ��ʼ��v
Beta=linspace(0,1,m); % beta���ȷֲ�

beta=Beta(m); % ��ʼ��beta
log_q_v=zeros(1,m);
[v,h]=gibbs_sampling(v,beta,a,b,a,b,W); % gibbs����v
curve_t=zeros(1,N);

%% logZ1
logZ1=0;
for j=1:length(a)
    logZ1=logZ1+log(1+exp(a(j)));
end
for i=1:length(b)
    logZ1=logZ1+log(1+exp(b(i)));
end



%% zeta_opt ϵ���Ż����
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
    p_L_v_norm=p_L_v/S;%��һ������
    
    % ϵ���Ż�
    if t<=t0
        zeta_temp=zeta+ones(1,m).*min(pai,t^(-alpha)).*p_L_v_norm./pai;
    else
        zeta_temp=zeta+ones(1,m).*min(pai,(t-t0+t0^alpha)^(-1)).*p_L_v_norm./pai;
    end

    zeta_now=zeta_temp-zeta_temp(1);
    
    log_p_L_v_now=log_q_v-zeta_now;
    p_L_v_now=exp(log_p_L_v_now-mean(log_p_L_v_now));
    S_now=sum(p_L_v_now);  
    p_L_v_now_norm=p_L_v_now/S_now; %�µĹ�һ������
   
    % �����µĹ�һ���������ɦ�
    p=rand;
    k=find(p<=cumsum(p_L_v_now_norm));
    beta=Beta(k(1));
    
    [v_new,h]=gibbs_sampling(v,beta,a,b,a,b,W);% �����µ� v
    v=v_new;
    zeta=zeta_now;
%     curve_opt(t)=logZ1+zeta(m); % ������������
end
Sams=zeta(m)+logZ1

%% zeta_t ϵ��û���Ż���
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
%     p_L_v_norm=p_L_v/S;%��һ������
%     

%     zeta_temp=zeta+ones(1,m)./t.*p_L_v_norm./pai; % ϵ��û���Ż��Ĺ�ʽ
%     zeta_now=zeta_temp-zeta_temp(1);
%     
%     log_p_L_v_now=log_q_v-zeta_now;
%     p_L_v_now=exp(log_p_L_v_now-mean(log_p_L_v_now));
%     S_now=sum(p_L_v_now);  
%     p_L_v_now_norm=p_L_v_now/S_now;
%    
%         %%���ɦ�
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
    