clear all;

clc;
z=zeros(8,1);
load h500.mat
% [Ais,curve_ais]=AIS(parameter_a,parameter_b,parameter_W,1000000);
[Tap,curve_tap]=TAP(parameter_b,parameter_a,parameter_W);
% [Rts,curve_rts]=RTS(parameter_a,parameter_b,parameter_W,0.2);
% [Sams,curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
% plot(curve_opt,'r');
% hold on;
% plot(curve_t,'b');

% load h10.mat;
% [h10,curve_ais]=AIS(parameter_a,parameter_b,parameter_W,1000000);
% z[1]=h10;

