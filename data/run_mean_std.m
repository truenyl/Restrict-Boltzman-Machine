% ������Ϊͳ�Ƹ����㷨����ֵ�ľ�ֵ����׼��

clear all;

load h20.mat
M=20; % ����ѭ������

%% Ais
% Ais=zeros(1,M);
% for i=1:M
%     [Ais(i),curve_ais]=AIS(parameter_a,parameter_b,parameter_W,1000000);
% end
% m_ais=mean(Ais)
% s_ais=std(Ais)

%% Tap
% Tap=zeros(1,M);
% for i=1:M
%     [Tap(i),curve_tap]=TAP(parameter_b,parameter_a,parameter_W);
% end
% m_tap=mean(Tap)
% s_tap=std(Tap)

%% Sams
Sams=zeros(1,M);
for i=1:M
    [Sams(i),curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
end
m_sams=mean(Sams)
s_sams=std(Sams)
