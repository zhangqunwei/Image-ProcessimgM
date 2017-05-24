%% HSI格式 RGB 格式
% *实现图像在HSI格式和RGB格式之间的相互转换*
%%

function main()
%% 加载图像
rgb=imread('peppers.png');

%% *1.分别显示R,G,B*
% <..\doc\rgbshow.doc rgbshow()> 
    figure('name','1.分别显示R,G,B各个分量','NumberTitle','off');
    rgb1=rgb;
    rgbshow(rgb1);      
    %%
    % 
    % <<..\1.bmp>>
    % 

%% *2.改变色彩*
% <..\doc\rgbshow.doc rgbshow()>
%R1=0.3R
%G1=0.4G
%B1=0.8B
    figure('name','2.改变R,G,B各个分量','NumberTitle','off');
    rgb2=rgb;
    rgbshow(rgb2,0.3,0.4,0.8);  
    %%
    % 
    % <<..\2.bmp>>
    % 

%% *3.RGB格式与HSI格式之间的转换*
    
    %% RGB ==> HSI
    % <..\doc\rgb2hsi.doc rgb2hsi()>
    figure('name','3.RGB转HSI格式','NumberTitle','off');
    rgb3=rgb;
    [H,S,I]=rgb2hsi(rgb3);
    subplot(221);imshow(rgb3);title('RGB原图像');
    subplot(222);imshow(H);title('H分量');
    subplot(223);imshow(S);title('S分量'); 
    subplot(224);imshow(I);title('I分量');    
    %%
    % 
    % <<..\3.bmp>>
    % 
    %% HSI ==> RGB
    % <..\doc\hsi2rgb.doc hsi2rgb()>
%figure('name','3.HSI转RGB格式','NumberTitle','off');
%[RGB,R,G,B]=hsi2rgb(H,S,I);
%subplot(221);imshow(cat(3,H,S,I));title('HSI原图像');
%subplot(222);imshow(R);title('R分量');
%subplot(223);imshow(G);title('G分量'); 
%subplot(224);imshow(B);title('B分量');   
%figure('name','HSI转RGB格式后图像','NumberTitle','off');
%imshow(RGB);
    
%% *4. 改变色调，饱和度和密度*
    rgb4=rgb;
    %% 第一组
    % <..\doc\rgb2hsi.doc rgb2hsi()>
    figure('name','4.RGB转HSI格式修改参数1','NumberTitle','off');    
    [H,S,I]=rgb2hsi(rgb4,0.8,0.4,0.31);
    subplot(221);imshow(rgb3);title('RGB原图像');
    subplot(222);imshow(H);title('H分量');
    subplot(223);imshow(S);title('S分量'); 
    subplot(224);imshow(I);title('I分量');     
    %%
    % 
    % <<..\4.1.bmp>>
    % 
    
    %% 第二组
    % <..\doc\rgb2hsi.doc rgb2hsi()>
    figure('name','4.RGB转HSI格式修改参数2','NumberTitle','off');  
    [H,S,I]=rgb2hsi(rgb4,1.5,1.1,1.5);
    subplot(221);imshow(rgb3);title('RGB原图像');      
    subplot(222);imshow(H);title('H分量');
    subplot(223);imshow(S);title('S分量'); 
    subplot(224);imshow(I);title('I分量'); 
    %%
    % 
    % <<..\4.2.bmp>>
    %     
