% �����뻭�����㷨����������

clear all;

clc;

% load h10.mat
% [Tap,curve_tap]=TAP(parameter_b,parameter_a,parameter_W);
% subplot(2,2,1);
% plot(curve_tap,'b');
% xlabel('��������');
% ylabel('��һ������');
% title('h10');
% 
% load h20.mat
% [Tap,curve_tap]=TAP(parameter_b,parameter_a,parameter_W);
% subplot(2,2,2);
% plot(curve_tap,'b');
% xlabel('��������');
% ylabel('��һ������');
% title('h20');
% 
% 
% load h100.mat
% [Tap,curve_tap]=TAP(parameter_b,parameter_a,parameter_W);
% subplot(2,2,3);
% plot(curve_tap,'b');
% xlabel('��������');
% ylabel('��һ������');
% title('h100');
% 
% 
% load h500.mat
% [Tap,curve_tap]=TAP(parameter_b,parameter_a,parameter_W);
% subplot(2,2,4);
% plot(curve_tap,'b');
% xlabel('��������');
% ylabel('��һ������');
% title('h500');

load h10.mat
[Rts,curve_rts]=RTS(parameter_a,parameter_b,parameter_W,0.006);
subplot(2,2,1);
plot(curve_rts,'b');
xlabel('��������');
ylabel('��һ������');
title('h10');

load h20.mat
[Rts,curve_rts]=RTS(parameter_a,parameter_b,parameter_W,0.001);
subplot(2,2,2);
plot(curve_rts,'b');
xlabel('��������');
ylabel('��һ������');
title('h20');


load h100.mat
[Rts,curve_rts]=RTS(parameter_a,parameter_b,parameter_W,0.02);
subplot(2,2,3);
plot(curve_rts,'b');
xlabel('��������');
ylabel('��һ������');
title('h100');


load h500.mat
[Rts,curve_rts]=RTS(parameter_a,parameter_b,parameter_W,0.2);
subplot(2,2,4);
plot(curve_rts,'b');
xlabel('��������');
ylabel('��һ������');
title('h500');



%% Sams
% load h10.mat
% [Sams,curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
% subplot(2,2,1);
% plot(curve_opt,'b');hold on;
% plot(curve_t,'r');
% xlabel('��������');
% ylabel('��һ������');
% title('h10');
% 
% load h20.mat
% [Sams,curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
% subplot(2,2,2);
% plot(curve_opt,'b');hold on;
% plot(curve_t,'r');
% xlabel('��������');
% ylabel('��һ������');
% title('h20');
% 
% load h100.mat
% [Sams,curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
% subplot(2,2,3);
% plot(curve_opt,'b');hold on;
% plot(curve_t,'r');
% xlabel('��������');
% ylabel('��һ������');
% title('h100');
% 
% load h500.mat
% [Sams,curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
% subplot(2,2,4);
% plot(curve_opt,'b');hold on;
% plot(curve_t,'r');
% xlabel('��������');
% ylabel('��һ������');
% title('h500');

