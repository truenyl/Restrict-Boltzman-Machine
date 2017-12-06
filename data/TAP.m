% TAP��curve_tap������������

function [Tap,curve_tap]=TAP(a,b,W)
N=30;
tao=zeros(1,N);
curve_tap=zeros(1,N);
v=rand(1,length(a)); % ��ʼ��v
h=rand(1,length(b)); % ��ʼ��h
for i=1:N
%     tao(i)=tao_TAP_3(v,h,a,b,W);
    new_h=sigm(b+v*W-(v-v.*v)*(W.*W).*(h-1/2));
    new_v=sigm(a+new_h*W'-(new_h-new_h.*new_h)*(W.*W)'.*(v-1/2));
    v=new_v;
    h=new_h;
%     tao(i)=tao_TAP(v,h,a,b,W); % �������׼���
    tao(i)=tao_TAP_3(v,h,a,b,W); % �������׼���
end
Tap=-tao(N)
curve_tap=-tao;

