function test55
%% 5.��ͼ��ֲ���ǿ������һ����ͼ��'eight.tif'�н������²���
%       1.�Ҷ���;
%       2.ͼ��䰵;
%       3.���ͶԱȶȺ�ѡ���������紦��һ���ֽ����˲���

%% ��ʼ��
clc;        % ��������
clf;        % ���ͼ�δ���
clear       % ���������

% ����ͼ��
I=imread('eight.tif');
subimage(I);
title('ԭʼͼ��');

%% 1.�Ҷ���
I1=imadjust(I,[0 1],[1,0],1.0);
subimage(I1);
title('1.�Ҷȷ�ת');

%% 2.ͼ��䰵
I2=imadjust(I1,[0.3 0.7],[],1.3);
subimage(I2);
title('2.ͼ��䰵');
% ��ʱ2s
pause(3);

%% 3.���ͶԱȶȺ�ѡ���������紦��һ���ֽ����˲�
% �����ѡ��Ҫ�����Ķ�������򡣷���һ����ֵͼ��
title('��ѡ��Ҫ����������');
pause(3);
%%
BW=roipoly(I2);
subimage(BW);
title('��ɫΪ��������');

%% 
% ����ģ���Աȶ���ǿ�˲�
H2=fspecial('unsharp',0.5);
I32=roifilt2(H2,I2,BW);
pause(4);
subimage(I32);
title('�Աȶ���ǿ');