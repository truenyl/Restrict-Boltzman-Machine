clear all;

clc;
z=zeros(8,1);
load test.mat

load h10.mat
[z(1),curve_ais]=AIS(parameter_a,parameter_b,parameter_W,100000);
z(5)=PROB(parameter_a,parameter_b,parameter_W,testbatchdata,z(1));

load h20.mat
s=zeros(1,5);
for i=1:5
[s(i),curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
end
z(2)=mean(s);
z(6)=PROB(parameter_a,parameter_b,parameter_W,testbatchdata,z(2));

load h100.mat
[z(3),curve_ais]=AIS(parameter_a,parameter_b,parameter_W,100000);
z(7)=PROB(parameter_a,parameter_b,parameter_W,testbatchdata,z(3));

load h500.mat
[z(4),curve_ais]=AIS(parameter_a,parameter_b,parameter_W,100000);
z(8)=PROB(parameter_a,parameter_b,parameter_W,testbatchdata,z(4));


save z z