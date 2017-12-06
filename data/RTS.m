% ecuΪ����Ҫ��curve_rtsΪ������������

function [Rts,curve_rts]=RTS(a,b,W,ecu)
K=100; % beta�ĸ���
Beta=linspace(0,1,K); % ��������beta
logZ=zeros(1,K);
c=zeros(1,K);
x=sigm(b)>rand(1,length(b)); % ��ʼ��x
position=randi(K,1);
beta=Beta(position); % ��ʼ��beta

r=1/K*ones(1,K); % ����ƽ�ȷֲ�
N=50;
% M=2000;

% t=0;

% ����logZ
for j=1:length(a)
    logZ=logZ+log(1+exp(a(j)));
end
for i=1:length(b)
    logZ=logZ+log(1+exp(b(i)));
end

ite=0; % �������е�ʱ����ʾ����

curve_rts=logZ(K); % ��ͼ��

while(true)
    ite=ite+1
    for t=1:N
        [x_new,h]=gibbs_sampling(x,beta,a,b,a,b,W); % �����µ�x
        x=x_new;
        
        for i=1:K
            log_Fk(i)=log_Pk(x,Beta(i),a,b,a,b,W); % ��fk
        end
    
        log_q_beta_x=log_Fk-logZ;
        q_beta_x=exp(log_q_beta_x-mean(log_q_beta_x));
        S=sum(q_beta_x);
        q_beta_x_norm=q_beta_x/S; % ��һ����beta�������ֲ�

        c=c+1/N*q_beta_x_norm; % ����c
    
        p=rand;
        k=find(p<cumsum(q_beta_x_norm));
        beta=Beta(k(1)); % �����µ�beta
    
    end
    
    c=c/sum(c);
    logZ=logZ+log(c)-log(c(1)); % ����logZ
    
    if(max(abs(r-c))<ecu && ite>600)
        % ������ֵ����ѭ����ite>600��Ϊ�˻�ͼ��ʹ��RTS���й�һ�����Ƶ�ʱ��������ý�С��ֵ
        break;
    end
    
    curve_rts=[curve_rts logZ(K)]; % ��ͼ��
%     c=zeros(1,K);
end


logZ(K)
Rts=logZ;
% plot(curve_rts);
