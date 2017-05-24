%% hsi格式转换成rgb格式
%    
%%

function [varargout]=hsi2rgb(varargin)
%% 提取H,S,I各个分量
    switch nargin
        case 1
            H=varargin{1}(:,:,1);
            S=varargin{1}(:,:,2);
            I=varargin{1}(:,:,3);
        case 3
            H=varargin{1};
            S=varargin{2};
            I=varargin{3};
    end
    % 对H分量反归一化
        H=2*pi*H;

%% 为R,G,B分配空间
    % size(hsi, 1) 表示取函数返回值的第一个参数
    R = zeros(size(H, 1), size(H, 2));   
    G = R;   
    B = R;   
    
%% 当 0 <= H < 2*pi/3 时 
    %i = find( (0 <= H) & (H < 2*pi/3));
    %先将H转化为一维行矩阵
    %然后查找H中在0 <= H < 2*pi/3之间的元素并返回其一维下标索引
    %i为一维列矩阵
    i = find( (H >= 0) & (H < 2*pi/3));   
    B(i) = I(i) .* (1 - S(i));   
    R(i) = I(i) .* (1 + S(i) .* cos(H(i)) ./ cos(pi/3 - H(i)));   
    G(i) = 3*I(i) - R(i) - B(i);
    
%% 当 2*pi/3 <= H < 4*pi/3 时   
    i = find( (H >= 2*pi/3) & (H < 4*pi/3) );
    R(i) = I(i) .* (1 - S(i));   
    G(i) = I(i) .* (1 + S(i) .* cos(H(i) - 2*pi/3) ./ cos(pi - H(i)));   
    B(i) = 3*I(i) - R(i) - G(i);  
    
%% 当 4*pi/3 <= H < 2*pi 时 
    i = find( (4*pi/3 <= H) & (H <= 2*pi));   
    G(i) = I(i) .* (1 - S(i));   
    B(i) = I(i) .* (1 + S(i) .* cos(H(i) - 4*pi/3) ./cos(5*pi/3 - H(i)));   
    R(i) = 3*I(i) - G(i) - B(i);   
     
%% 归一化
%min(RGB, 1) 保留小于1的，将RGB中大于1的值赋值为1 
%max(RGB, 0) 保留大于0的，将RGB中小于0的值赋值为0
    RGB = max(min(cat(3, R, G, B), 1), 0); 
                               

%% 设置 H S I 各个分量系数
    if nargin==4
        R=varargin{2}*R;
        G=varargin{3}*G;
        B=varargin{4}*B;
    end

%% 输出
% out=[RGB,B,G,B];
    switch nargout
        case 1
            varargout{1}=RGB;
        case 3
            varargout{1}=R;
            varargout{2}=G;
            varargout{3}=B;
        case 4
            varargout{1}=RGB;
            varargout{2}=R;
            varargout{3}=G;
            varargout{4}=B;
    end