function test53
%% 3.������ͼ��'chess.mat'���м���
%   (1) ����ʽ���У�
%   (2) �ǽ���ʽ���У�

%% ��ʼ��
clc;        % ��������
clf;        % ���ͼ�δ���
clear       % ���������

% ����ͼ��
load chess.mat
subimage(X,map);
title('ԭͼ');

%% (1) ����ʽ����
imcrop
title('����ʽ����ͼ��');
%% (2) �ǽ���ʽ����
figureEx(3,'�ǽ���ʽ����ͼ��',[0.53,0.1,0.45,0.45])
X1=imcrop(X,map,[60 40 100 90]);
subimage(X1,map);title('�ǽ���ʽ����ͼ��');
