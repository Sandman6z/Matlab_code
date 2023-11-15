%卡尔曼滤波程序 https://card.weibo.com/article/h5/s#cid=23041882bc12a80102wiyc&vid=0&extparam=&from=1110006030&wm=9006_2001&ip=10.168.16.163

%对象：线性随机微分方程
%状态方程： X(k) = AX(k-1) + BU(k) + w(k)
%观测方程： Z(k) = HX(k) + v(k)

%五个基本公式：
%预测：
%    X(k|k-1) = AX(k-1|k-1) + BU(k)
%    P(k|k-1) = AP(k-1|k-1)A' + Q
%校正估计值：
%   X(k|k) = X(k|k-1) + Kg(k)[Z(k) - HX(k|k-1)]
%   Kg(k) = P(k|k-1)H' / [HP(k|k-1)H' + R]
%   P(k|k) = [I - Kg(k)H]P(k|k-1)



clear all
close all
clc

%初始化
N = 200;    %数据长度
w = randn(1,N);
v = randn(1,N);
Q = 0.000001;
R = 0.1;
A = 1;
H = 1;
B = 0;

X = zeros(1,N);
Z = zeros(1,N);
U = zeros(1,N);

%模拟出观测值Z(k)
for k = 1:N
    Z(k) = 25 + v(k);
end

%卡尔曼滤波
P = zeros(1,N);
P(1) = 10;
Kg = zeros(1,N);    %卡尔曼增益

for t = 2:N
    %计算X(k|k-1)和P(k|k-1)
    X(t) = A*X(t-1) + B*U(k);
    P(t) = A*P(t-1)*A' + Q;
    %计算Kg(k)   X(k|k)和P(k|k)
    Kg(t) = P(t)*H' / [H*P(t)*H' + R];
    X(t) = X(t) + Kg(t)*(Z(t) - H*X(t));
    P(t) = P(t) - H*Kg(t)*P(t);
end

t = 1:N;
plot(t,X,'r',t,Z,'g');