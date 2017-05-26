function test54
%% 4.编写一个图像增强的综合程序：对一给定灰度图像'pout.tif'进行增强处理,
%       1.添加椒盐噪声   
%       2.中值滤波
%       3.图像增亮
%       4.增加对比度
%       5.直方图均衡化

%% 初始化
clc;        % 清除命令窗口
clf;        % 清除图形窗口
clear       % 清除工作区

% 加载图像
I=imread('pout.tif');
subimage(I);
title('原始图像');

%% 1.添加椒盐噪声
I1=imnoise(I,'salt & pepper',0.02);
subimage(I1)
title('1.添加椒盐噪声后');

%% 2.中值滤波
% 用9x9的模版对灰度图像I1进行中值滤波，图像边缘补0，缺省为3x3
I2=medfilt2(I1,[9 9]);
subimage(I2)
title('2.对1进行中值滤波后');

%% 3.图像增亮
I3=imadjust(I,[0.3 0.7],[],0.3);
subimage(I3)
title('3.图像增亮后');

%% 4.增加对比度
% 产生预定义滤波器
H=fspecial('unsharp',0.3);
% 用模糊对比度增强滤波器H对图像I3进行锐化滤波，并进行数据转换
I4=uint8(filter2(H,I));
subimage(I4)
title('4.增加对比度');

%% 5.直方图均衡化
I5=histeq(I);
subimage(I5)
title('5.直方图均衡化');