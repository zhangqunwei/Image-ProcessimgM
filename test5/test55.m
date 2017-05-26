function test55
%% 5.用图像局部增强函数对一给定图像'eight.tif'中进行如下操作
%       1.灰度求反;
%       2.图像变暗;
%       3.降低对比度后选择明暗交界处的一部分进行滤波。

%% 初始化
clc;        % 清除命令窗口
clf;        % 清除图形窗口
clear       % 清除工作区

% 加载图像
I=imread('eight.tif');
subimage(I);
title('原始图像');

%% 1.灰度求反
I1=imadjust(I,[0 1],[1,0],1.0);
subimage(I1);
title('1.灰度反转');

%% 2.图像变暗
I2=imadjust(I1,[0.3 0.7],[],1.3);
subimage(I2);
title('2.图像变暗');
% 延时2s
pause(3);

%% 3.降低对比度后选择明暗交界处的一部分进行滤波
% 用鼠标选择要处理的多边形区域。返回一个二值图像。
title('请选择要处理的区域');
pause(3);
%%
BW=roipoly(I2);
subimage(BW);
title('白色为处理区域');

%% 
% 进行模糊对比度增强滤波
H2=fspecial('unsharp',0.5);
I32=roifilt2(H2,I2,BW);
pause(4);
subimage(I32);
title('对比度增强');
