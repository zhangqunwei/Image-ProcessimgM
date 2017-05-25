clc
clear
%% 1.����ͼ���ļ����� ��whos�����������ʾ��ͼ������

%% 
% *����ͼ��*
I01=imread('cameraman.tif','tif');
I02=imread('ngc6543a.jpg','jpg');
%%
% *�� ��whos�����������ʾ��ͼ������*
whos



%% 2.��ȡ 'ngc6543a.jpg'��ͼ����Ϣ
I02info=imfinfo('ngc6543a.jpg','jpg');
%%
% *����ڲ鿴ͼ����Ϣ*
I02info

%% 3.��4�������зֱ���ʾ4����ͬ���͵�ͼ��

%%
% *�Ҷ�ͼ��*
figure(1)
imshow('cameraman.tif');title('�Ҷ�ͼ��');
%%
% *����ͼ��*
figure(2)
imshow('forest.tif');title('����ͼ��');
%%
% *���ɫͼ��*
figure(3)
imshow('yellowlily.jpg');title('���ɫͼ��');
%%
% *��ֵͼ��*
figure(4)
imshow('circles.png');title('��ֵͼ��');

%% 4.����֡ͼ������mri.mat������֡ͼ���Է�����ʽ��ʾ��ͬһͼ�񴰿�
mri=uint8(zeros(128,128,1,27));
% *��ÿһ֡�����ڴ���*
for frame=1:27
[mri(:,:,:,frame),map]=imread('mri.tif',frame);
end
montage(mri,map);title('montage��֡ͼ����ʾ');

%% 5.ʹ��zoom��colorbar����
figure(5)
imshow('coins.png');title('ʹ��zoom��colorbar����');
zoom on
colorbar('vert')
colorbar('hotiz')

%% 6.�ֱ���imread��load������ʾ����ͼ����ͬһ��ͼ�񴰿�
figure(6)
load trees.mat
subplot(121);subimage(X,map);title('load');
[X2,map2]=imread('forest.tif');
subplot(122);subimage(X2,map2);title('imread');

%% 7.ʹ��dither��gray2ind��grayslice��ind2gray��rgb2gray��rgb2ind��im2bw��ind2rgb��mat2gray��д9������

%%
% *dither*
figure(7);title('dither');
RGB=imread('autumn.tif');
subplot(2,2,1);
subimage(RGB);
load chess;
subplot(2,2,2);
subimage(X,map);
Y=dither(RGB,map);
subplot(2,2,3);
subimage(Y,map);

%%
% *gray2ind*
figure(8);
I=imread('pout.tif');
imshow(I);title('ԭͼ');
[X1,map1]=gray2ind(I,128);
[X2,map2]=gray2ind(I,16);
figure(9)
imshow(X1,map1);title('gray2ind 128');
figure(10)
imshow(X2,map2);title('gray2ind 16');

%%
% *���ຯ�����ƣ�ֱ�ӵ��ü��ɡ�����ʱ�ɲ鿴Matlab�İ���*


