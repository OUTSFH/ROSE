%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%**程序名字：复数向量转变成四元数向量
%**作者：    Wangfei
%**日期：    2006-6
%**修改人：
%**日期：
%**描述：    复数向量转变成四元数向量
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output = FVeToQVe(u)

[a,b] = size(u);
% 取出分解后的特征向量的各部分(实部和虚部)
% 前半部
u11 = real(u(1:a/2,:));
u12 = imag(u(1:a/2,:));
% 后半部
u13 = real(u(a/2+1:a,:));
u14 = imag(u(a/2+1:a,:));

% 将分解出来的特征向量构造新的四元数向量
Nu = [u11(:,1), u12(:,1), -1*u13(:,1), u14(:,1)];
for p = 2:a
    Nu = [Nu,u11(:,p), u12(:,p), -1*u13(:,p), u14(:,p)];
end

output = Nu;
