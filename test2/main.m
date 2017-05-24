%% HSI��ʽ RGB ��ʽ
% *ʵ��ͼ����HSI��ʽ��RGB��ʽ֮����໥ת��*
%%

function main()
%% ����ͼ��
rgb=imread('peppers.png');

%% *1.�ֱ���ʾR,G,B*
% <..\doc\rgbshow.doc rgbshow()> 
    figure('name','1.�ֱ���ʾR,G,B��������','NumberTitle','off');
    rgb1=rgb;
    rgbshow(rgb1);      
    %%
    % 
    % <<..\1.bmp>>
    % 

%% *2.�ı�ɫ��*
% <..\doc\rgbshow.doc rgbshow()>
%R1=0.3R
%G1=0.4G
%B1=0.8B
    figure('name','2.�ı�R,G,B��������','NumberTitle','off');
    rgb2=rgb;
    rgbshow(rgb2,0.3,0.4,0.8);  
    %%
    % 
    % <<..\2.bmp>>
    % 

%% *3.RGB��ʽ��HSI��ʽ֮���ת��*
    
    %% RGB ==> HSI
    % <..\doc\rgb2hsi.doc rgb2hsi()>
    figure('name','3.RGBתHSI��ʽ','NumberTitle','off');
    rgb3=rgb;
    [H,S,I]=rgb2hsi(rgb3);
    subplot(221);imshow(rgb3);title('RGBԭͼ��');
    subplot(222);imshow(H);title('H����');
    subplot(223);imshow(S);title('S����'); 
    subplot(224);imshow(I);title('I����');    
    %%
    % 
    % <<..\3.bmp>>
    % 
    %% HSI ==> RGB
    % <..\doc\hsi2rgb.doc hsi2rgb()>
%figure('name','3.HSIתRGB��ʽ','NumberTitle','off');
%[RGB,R,G,B]=hsi2rgb(H,S,I);
%subplot(221);imshow(cat(3,H,S,I));title('HSIԭͼ��');
%subplot(222);imshow(R);title('R����');
%subplot(223);imshow(G);title('G����'); 
%subplot(224);imshow(B);title('B����');   
%figure('name','HSIתRGB��ʽ��ͼ��','NumberTitle','off');
%imshow(RGB);
    
%% *4. �ı�ɫ�������ͶȺ��ܶ�*
    rgb4=rgb;
    %% ��һ��
    % <..\doc\rgb2hsi.doc rgb2hsi()>
    figure('name','4.RGBתHSI��ʽ�޸Ĳ���1','NumberTitle','off');    
    [H,S,I]=rgb2hsi(rgb4,0.8,0.4,0.31);
    subplot(221);imshow(rgb3);title('RGBԭͼ��');
    subplot(222);imshow(H);title('H����');
    subplot(223);imshow(S);title('S����'); 
    subplot(224);imshow(I);title('I����');     
    %%
    % 
    % <<..\4.1.bmp>>
    % 
    
    %% �ڶ���
    % <..\doc\rgb2hsi.doc rgb2hsi()>
    figure('name','4.RGBתHSI��ʽ�޸Ĳ���2','NumberTitle','off');  
    [H,S,I]=rgb2hsi(rgb4,1.5,1.1,1.5);
    subplot(221);imshow(rgb3);title('RGBԭͼ��');      
    subplot(222);imshow(H);title('H����');
    subplot(223);imshow(S);title('S����'); 
    subplot(224);imshow(I);title('I����'); 
    %%
    % 
    % <<..\4.2.bmp>>
    %     
