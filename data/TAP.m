% TAP，curve_tap画收敛曲线用

function [Tap,curve_tap]=TAP(a,b,W)
N=30;
tao=zeros(1,N);
curve_tap=zeros(1,N);
v=rand(1,length(a)); % 初始化v
h=rand(1,length(b)); % 初始化h
for i=1:N
%     tao(i)=tao_TAP_3(v,h,a,b,W);
    new_h=sigm(b+v*W-(v-v.*v)*(W.*W).*(h-1/2));
    new_v=sigm(a+new_h*W'-(new_h-new_h.*new_h)*(W.*W)'.*(v-1/2));
    v=new_v;
    h=new_h;
%     tao(i)=tao_TAP(v,h,a,b,W); % 保留二阶级数
    tao(i)=tao_TAP_3(v,h,a,b,W); % 保留三阶级数
end
Tap=-tao(N)
curve_tap=-tao;

