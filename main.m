

% 1. beta(4) should be a function of P
% 2. the graph should be continious. 
% 3. implement 最小二乘法 学习出 四个beta的参数值
% 4. GUI 界面

clear;
clc;
parameter = [];
while true
string = input ('please input key-time point(t/s) (press enter to finish):','s');
if isempty(string)
	break;
end;
t = str2num(string);
string =input('please input T, L, P: ','s');
strcell = regexp(string,'\s+','split');

T = str2num(strcell{1});
L = str2num(strcell{2});
P = str2num(strcell{3});

parameter = [parameter; t T L P];
end;

string = input('please input end time: ','s');
finishT = str2num(string);
parameter = [parameter; finishT 0 0 0];
shiayan_chunzhu(parameter);