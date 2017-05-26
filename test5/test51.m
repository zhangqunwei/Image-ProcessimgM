function test51
%% 1.������ͼ��'wmandril.mat'������С
%   (1) ����3����
%   (2) ��С2����
%   (3) ������СΪ[20 80]��
% ע�⣺1. X,X1Ϊ�����������в��ض��ȡ��������
%       2. floor(X2)Ϊ��X2ȡ����������Ϊsubimage()�е����ݱ���Ϊ����������ʾ
%          X2,X3�����岹�����С��������Ҫ��ȡ��������
%       3. imshow()������ʾС�������ݡ�

%% ��ʼ��
clc;        % ��������
clf;        % ���ͼ�δ���
clear       % ���������

% ����ͼ��
% load wmandril.mat
X=imread('cameraman.tif');
%figureEx(1,'ԭʼͼ��',[0,0,1,1])
subimage(X);

%% (1) ����3��
%figureEx(2,'����3��',[0.3,0,1,1])
figure(2)
% ����һ: ����ڷ��岹(nearest)
% ˵��:   ������ص�ĸ�ֵΪ��ǰ������ص�
X1=imresize(X,3,'nearest');
subplot(2,2,1)
subimage(X1);
title('����ڷ��岹');

% ������: ˫���Բ岹(bilinear)
% ˵��  : ������ص�ĸ�ֵΪ2x2��������������Ч��ļ�Ȩƽ��ֵ
X2=imresize(X,3,'bilinear');
subplot(2,2,2)
subimage(X2);
title('˫���Բ岹');

% ������: ˫�����岹(bicubic)
% ˵��  : ������ص�ĸ�ֵΪ4x4��������������Ч��ļ�Ȩƽ��ֵ
X3=imresize(X,3,'bicubic');
subplot(2,2,3)
subimage(floor(X3));
title('˫�����岹');

%% (2) ��С2��
%figureEx(3,'��С2��',[0.5,0,1,1])
figure(3)
% ����һ: ����ڷ��岹(nearest)
% ˵��:   ������ص�ĸ�ֵΪ��ǰ������ص�
X1=imresize(X,0.5,'nearest');
subplot(2,2,1)
subimage(X1);
title('����ڷ��岹');

% ������: ˫���Բ岹(bilinear)
% ˵��  : ������ص�ĸ�ֵΪ2x2��������������Ч��ļ�Ȩƽ��ֵ
X2=imresize(X,0.5,'bilinear');
subplot(2,2,2)
subimage(floor(X2));
title('˫���Բ岹');

% ������: ˫�����岹(bicubic)
% ˵��  : ������ص�ĸ�ֵΪ4x4��������������Ч��ļ�Ȩƽ��ֵ
X3=imresize(X,0.5,'bicubic');
subplot(2,2,3)
subimage(floor(X3));
title('˫�����岹');


%% (3) ������СΪ[20 80]
% figureEx(4,'������СΪ[20 80]',[0.7,0,0.3,0.8])
figure(4)
% ����һ: ����ڷ��岹(nearest)
% ˵��:   ������ص�ĸ�ֵΪ��ǰ������ص�
X1=imresize(X,[20 80],'nearest');
subplot(2,2,1)
subimage(X1);
title('����ڷ��岹');

% ������: ˫���Բ岹(bilinear)
% ˵��  : ������ص�ĸ�ֵΪ2x2��������������Ч��ļ�Ȩƽ��ֵ
X2=imresize(X,[20 80],'bilinear');
subplot(2,2,2)
subimage(floor(X2));
title('˫���Բ岹');

% ������: ˫�����岹(bicubic)
% ˵��  : ������ص�ĸ�ֵΪ4x4��������������Ч��ļ�Ȩƽ��ֵ
X3=imresize(X,[20 80],'bicubic');
subplot(2,2,3)
subimage(floor(X3));
title('˫�����岹');
