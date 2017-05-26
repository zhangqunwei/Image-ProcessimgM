function test52
%% 2.������ͼ��'flowers.mat'������ת
%   (1) ˳ʱ����ת30�㣻
%   (2) ��ʱ����ת60�㣻
%   (3) ��ʱ����ת90�㣻
%   (4) �ò���'crop'��ʱ����ת60�㡣

%% ��ʼ��
clc;        % ��������
clf;        % ���ͼ�δ���
clear       % ���������

% ����ͼ��
load wmandril.mat 
subimage(floor(X),map);title('ԭͼ');

%% (1) ˳ʱ����ת30��
figure('name','˳ʱ����ת30��','NumberTitle','off');
% ����һ: ����ڷ��岹(nearest)
% ˵��:   ������ص�ĸ�ֵΪ��ǰ������ص�
X1=imrotate(X,-30,'nearest');
subplot(1,3,1)
subimage(floor(X1),map);
title('����ڷ��岹');

% ������: ˫���Բ岹(bilinear)
% ˵��  : ������ص�ĸ�ֵΪ2x2��������������Ч��ļ�Ȩƽ��ֵ
X2=imrotate(X,-30,'bilinear');
subplot(1,3,2)
subimage(floor(X2),map);
title('˫���Բ岹');

% ������: ˫�����岹(bicubic)
% ˵��  : ������ص�ĸ�ֵΪ4x4��������������Ч��ļ�Ȩƽ��ֵ
X3=imrotate(X,-30,'bicubic');
subplot(1,3,3)
subimage(floor(X3),map);
title('˫�����岹');

%% (2) ��ʱ����ת60��
figure('name','��ʱ����ת60��','NumberTitle','off');
% ����һ: ����ڷ��岹(nearest)
% ˵��:   ������ص�ĸ�ֵΪ��ǰ������ص�
X1=imrotate(X,60,'nearest');
subplot(1,3,1)
subimage(floor(X1),map);
title('����ڷ��岹');

% ������: ˫���Բ岹(bilinear)
% ˵��  : ������ص�ĸ�ֵΪ2x2��������������Ч��ļ�Ȩƽ��ֵ
X2=imrotate(X,60,'bilinear');
subplot(1,3,2)
subimage(floor(X2),map);
title('˫���Բ岹');

% ������: ˫�����岹(bicubic)
% ˵��  : ������ص�ĸ�ֵΪ4x4��������������Ч��ļ�Ȩƽ��ֵ
X3=imrotate(X,60,'bicubic');
subplot(1,3,3)
subimage(floor(X3),map);
title('˫�����岹');

%% (3) ��ʱ����ת90��
figure('name','��ʱ����ת90��','NumberTitle','off');
% ����һ: ����ڷ��岹(nearest)
% ˵��:   ������ص�ĸ�ֵΪ��ǰ������ص�
X1=imrotate(X,90,'nearest');
subplot(1,3,1)
subimage(floor(X1),map);
title('����ڷ��岹');

% ������: ˫���Բ岹(bilinear)
% ˵��  : ������ص�ĸ�ֵΪ2x2��������������Ч��ļ�Ȩƽ��ֵ
X2=imrotate(X,90,'bilinear');
subplot(1,3,2)
subimage(floor(X2),map);
title('˫���Բ岹');

% ������: ˫�����岹(bicubic)
% ˵��  : ������ص�ĸ�ֵΪ4x4��������������Ч��ļ�Ȩƽ��ֵ
X3=imrotate(X,90,'bicubic');
subplot(1,3,3)
subimage(floor(X3),map);
title('˫�����岹');

%% (4) �ò���'crop'��ʱ����ת60��
figure('name','�ò���crop��ʱ����ת60��','NumberTitle','off');
% ����һ: ����ڷ��岹(nearest)
% ˵��:   ������ص�ĸ�ֵΪ��ǰ������ص�
X1=imrotate(X,60,'nearest','crop');
subplot(1,3,1)
subimage(floor(X1),map);
title('crop-����ڷ��岹');

% ������: ˫���Բ岹(bilinear)
% ˵��  : ������ص�ĸ�ֵΪ2x2��������������Ч��ļ�Ȩƽ��ֵ
X2=imrotate(X,60,'bilinear','crop');
subplot(1,3,2)
subimage(floor(X2),map);
title('crop-˫���Բ岹');

% ������: ˫�����岹(bicubic)
% ˵��  : ������ص�ĸ�ֵΪ4x4��������������Ч��ļ�Ȩƽ��ֵ
X3=imrotate(X,60,'bicubic');
subplot(1,3,3)
subimage(floor(X3),map);
title('crop-˫�����岹');