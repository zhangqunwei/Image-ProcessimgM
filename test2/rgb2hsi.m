%% rgb格式转换成hsi格式
%    
%%



function [varargout]=rgb2hsi(varargin)

%% 检查第一个参数，必须为rgb图像数据
    if ischar(varargin{1})
        hs=msgbox('参数不合法！','通知','warn');
        ht=findobj(hs,'type','text');
        set(ht,'FontSize',11);
        % 等待确定
        uiwait(hs);
        return 
    end
    
%% 提取R G B 分量
%im2double()和double()函数的区别：
%im2double()将图像数据转换为double类型后将其量化到[0 1]区间内 
%double() 只是提高数据精度，并未量化到[0 1]之间
    rgb=im2double(varargin{1});
    R=rgb(:,:,1);
    G=rgb(:,:,2);
    B=rgb(:,:,3);
    
%% 计算 H S I
%
    % 计算H
    H_num=(R-G)+(R-B)/2;
    H_den=sqrt((R-G).^2+(R-B).*(G-B));
    H=acos(H_num./(H_den+eps)); % 添加eps函数，防止分母为零
    H(B>G)=2*pi-H(B>G);    
    H=H/(2*pi);                 % 将H 范围归一化为[0 1]  
    % 计算S
    S_num=min(min(R,G),B);
    S_den=R+G+B;
    S=1-3.*S_num./(S_den+eps);    
    H(S==0)=0;
    % 计算I
    I=(R+G+B)/3;
    
%% 设置 H S I 各个分量系数
    if nargin==4
        H=varargin{2}*H;
        S=varargin{3}*S;
        I=varargin{4}*I;
    end  
    % H 为复数，取模
    H=abs(H);
    
%% 输出
% out=[HSI,H,S,I];
    switch nargout
        case 1
            varargout{1}=cat(3,H,S,I);
        case 3
            varargout{1}=H;
            varargout{2}=S;
            varargout{3}=I;
        case 4
            varargout{1}=cat(3,H,S,I);
            varargout{2}=H;
            varargout{3}=S;
            varargout{4}=I;
    end