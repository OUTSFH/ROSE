%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%**程序名字：四元数列向量转变成行向量
%**作者：    Wangfei
%**日期：    2005-12
%**修改人：
%**日期：
%**描述：    四元数列向量转变成行向量
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function QRow = ColToRow(vNTC)
% 四元数列向量转变成行向量
% 例如将vNTC = [1,2,3,4;1,1,1,1];变成[1,2,3,4,1,1,1,1]

[a,b] = size(vNTC);

A = zeros(1,a*b);

% 将列向量转变成行向量
for p = 1:a
    A(1,(p-1)*4+1:p*4) = vNTC(p,:);
end

QRow = A;

