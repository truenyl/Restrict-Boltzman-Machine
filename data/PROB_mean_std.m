% 计算似然值的均值和标准差

load test.mat

N=10;
con=zeros(1,N);
pro=zeros(1,N);
load h20.mat
for i=1:N
% [con(i),curve_ais]=AIS(parameter_a,parameter_b,parameter_W,100000);
[con(i),curve_t,curve_opt]=SAMS(parameter_a,parameter_b,parameter_W);
pro(i)=PROB(parameter_a,parameter_b,parameter_W,testbatchdata,con(i));
end
ave_pro=mean(pro)
std_pro=std(pro)