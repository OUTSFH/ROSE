% DOA estimation by MUSIC 
% Developed by xiaofei zhang (南京航空航天大学 电子工程系 张小飞）
% EMAIL:zhangxiaofei@nuaa.edu.cn
clear all
close all
derad = pi/180;        % deg -> rad
radeg = 180/pi;
twpi = 2*pi;
kelm = 8;               % 阵列数量
dd = 0.5;               % space 
d=0:dd:(kelm-1)*dd;     % 
iwave = 3;              % number of DOA
theta = [10 30 60];     % 角度
snr = 10;               % input SNR (dB)
n = 500;                 % 
A=exp(-j*twpi*d.'*sin(theta*derad));%%%% direction matrix
S=randn(iwave,n);
X=A*S;
X1=awgn(X,snr,'measured');
Rxx=X1*X1'/n;
InvS=inv(Rxx); %%%%求逆
[EV,D]=eig(Rxx);%%%% (eig:返回矩阵的特征向量和特征值)
EVA=diag(D)';
[EVA,I]=sort(EVA);
EVA=fliplr(EVA);%（fliplr：左右翻转）
EV=fliplr(EV(:,I));

% MUSIC
for iang = 1:361
        angle(iang)=(iang-181)/2;
        phim=derad*angle(iang);
        a=exp(-j*twpi*d*sin(phim)).';
        L=iwave;    
        Un=EV(:,L+1:kelm);      %噪声子空间
        SP(iang)=1/(a'*Un*Un'*a);
end
   
% 
SP=abs(SP);
SPmax=max(SP);
SP=10*log10(SP/SPmax);
h=plot(angle,SP);
set(h,'Linewidth',2)
xlabel('angle (degree)')
ylabel('magnitude (dB)')
axis([-90 90 -60 0])
set(gca, 'XTick',[-90:30:90])
grid on  




