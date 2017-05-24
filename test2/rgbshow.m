%% 显示rgb图像的R,G,B各个分量
%
%%


function rgbshow(varargin)
%显示RGB原图像及各个分量图像
%注意：在调用该函数前需使用figure()创建新窗口
%例如：I为rgb图像,各个分量为IR,IG,IB
%       figure('name','1.分别显示R,G,B各个分量','NumberTitle','off');
%       rgbshow(I);                    % R=IR,G=IG,B=IB
%       figure('name','2.改变R,G,B各个分量','NumberTitle','off');
%       rgbshow(I, 0.3, 0.4, 0.8);     % R=0.3IR,G=0.3IG,B=0.8IB 

%% 检查第一个参数，必须为rgb图像数据
    if ischar(varargin{1})
        hs=msgbox('参数不合法！','通知','warn');
        ht=findobj(hs,'type','text');
        set(ht,'FontSize',11);
        % 等待确定
        uiwait(hs);
        return 
    end
%% 接收图像
    rgb=varargin{1};
%% 分离R,G,B
    R=rgb(:,:,1);
    G=rgb(:,:,2);
    B=rgb(:,:,3);
%% 加入参数
    if nargin==4
        R=varargin{2}*R;
        G=varargin{3}*G;
        B=varargin{4}*B;
    end
%% 显示
    subplot(231);imshow(rgb);title('原图像');
    subplot(232);imshow(cat(3,R,G,B));title('RGB合成图像');
    if nargin==4    
        subplot(234);imshow(R);title([num2str(varargin{2}),'R分量']);
        subplot(235);imshow(G);title([num2str(varargin{3}),'G分量']);
        subplot(236);imshow(B);title([num2str(varargin{4}),'B分量']);
    else
        subplot(234);imshow(R);title('R分量');
        subplot(235);imshow(G);title('G分量');
        subplot(236);imshow(B);title('B分量'); 
    end