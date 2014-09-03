%--------------------------------------------------------
%这是模型的总程序，包括：加水模型+成熟模型+沉浮模型
%y1-y10为饺子的分层温度   y11、y12为锅壁温度   y13为水温   dy14为水的蒸发量
%------------------------------------------------------
function shiayan_chunzhu()

global beta

% T = [26 27.4 28.1 29.5 30.5 31.4 35.9 36.4 36.5 36.7 39.1 40.1 42 43.7 44.9 46.4 47.2 44.5 47.7 50.3 50.8 51.1 52.9 53.7 53.3 55.4 57.4 55.5 57.5 58.2 59.2 60.6 61.8 63.3 62.5 63.6 65.6 65.5 66.5 67.4 68.2 69.8 70.5 71.6 71.3 72.5 73.5 73.8 74.1 74.9 75.1 76 77.1 76.4 77.9 78.4 78.9 79.6 81 81.8 82.4 83.1 83.6 84.3 85.2 86.1 86.5 86.8 87.2 87.6 88.3 88.8 89.2 89.9 90.3 90.9 91.2 91.6 92.3 92.1];
% M = [5.826 5.8232 5.8228 5.822 5.8214 5.8208 5.8202 5.8194 5.8186 5.8176 5.8164 5.815 5.8136 5.812 5.8098 5.8076 5.805 5.8018 5.7988 5.7946 5.7906 5.7858 5.7806 5.7742 5.7678 5.76 5.752 5.7412 5.7316 5.7182 5.7016 5.6852 5.6762];
% t = 0:30:2370;
% tt = 0:1:2370;
% TT = interp1(t,T,tt);
% plot(tt,TT,'r')
% hold on
beta(2) = 5;
beta(3) = 5;
beta(4) = 3;
beta(1) = 1000;

ret = [];
reT = [];

prefixParameter = ones(1,10) * 273;
interiorT = 87.33266614823512;
exteriorT = 86.00053214312918;
waterT = 87.55137634502235;
vaporizationL = 0.2259401725364559;
P = 1000;
L = 3;
duriation = 1000;

[thist, thisy] = ode23('zhengti_chun',[0 duriation],[prefixParameter, interiorT,exteriorT,waterT,vaporizationL, P,L, beta]);
for i = 1:10
	thisy(i,13)
end;
if length(ret) == 0
	offset = 0;
else
	offset = ret(end);
end;
ret = [ret ; thist + offset];
reT = [reT ; thisy(:,13)];
% [ret reT]

plot(ret,reT);
