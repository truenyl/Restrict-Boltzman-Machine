% TAP保留二阶级数的迭代方式

function tao=tao_TAP(v,h,a,b,W)
if (any(v==1)||any(v==0)||any(h==1)||any(h==0))
    index_v = find(v~=1&v~=0);
    index_h = find(h~=1&h~=0);
    tao=-a*v'-b*h'-v*W*h'-1/2*(v-v.*v)*(W.*W)*(h-h.*h)';
    tao = tao + sum(v(index_v).*log(v(index_v))+(1-v(index_v)).*log(1-v(index_v)));
    tao = tao + sum(h(index_h).*log(h(index_h))+(1-h(index_h)).*log(1-h(index_h)));
else
    tao=v*(log(v))'+(1-v)*(log(1-v))'+h*(log(h))'+(1-h)*(log(1-h))'...
    -a*v'-b*h'-v*W*h'-1/2*(v-v.*v)*(W.*W)*(h-h.*h)';
end
