%% hsi��ʽת����rgb��ʽ
%    
%%

function [varargout]=hsi2rgb(varargin)
%% ��ȡH,S,I��������
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
    % ��H��������һ��
        H=2*pi*H;

%% ΪR,G,B����ռ�
    % size(hsi, 1) ��ʾȡ��������ֵ�ĵ�һ������
    R = zeros(size(H, 1), size(H, 2));   
    G = R;   
    B = R;   
    
%% �� 0 <= H < 2*pi/3 ʱ 
    %i = find( (0 <= H) & (H < 2*pi/3));
    %�Ƚ�Hת��Ϊһά�о���
    %Ȼ�����H����0 <= H < 2*pi/3֮���Ԫ�ز�������һά�±�����
    %iΪһά�о���
    i = find( (H >= 0) & (H < 2*pi/3));   
    B(i) = I(i) .* (1 - S(i));   
    R(i) = I(i) .* (1 + S(i) .* cos(H(i)) ./ cos(pi/3 - H(i)));   
    G(i) = 3*I(i) - R(i) - B(i);
    
%% �� 2*pi/3 <= H < 4*pi/3 ʱ   
    i = find( (H >= 2*pi/3) & (H < 4*pi/3) );
    R(i) = I(i) .* (1 - S(i));   
    G(i) = I(i) .* (1 + S(i) .* cos(H(i) - 2*pi/3) ./ cos(pi - H(i)));   
    B(i) = 3*I(i) - R(i) - G(i);  
    
%% �� 4*pi/3 <= H < 2*pi ʱ 
    i = find( (4*pi/3 <= H) & (H <= 2*pi));   
    G(i) = I(i) .* (1 - S(i));   
    B(i) = I(i) .* (1 + S(i) .* cos(H(i) - 4*pi/3) ./cos(5*pi/3 - H(i)));   
    R(i) = 3*I(i) - G(i) - B(i);   
     
%% ��һ��
%min(RGB, 1) ����С��1�ģ���RGB�д���1��ֵ��ֵΪ1 
%max(RGB, 0) ��������0�ģ���RGB��С��0��ֵ��ֵΪ0
    RGB = max(min(cat(3, R, G, B), 1), 0); 
                               

%% ���� H S I ��������ϵ��
    if nargin==4
        R=varargin{2}*R;
        G=varargin{3}*G;
        B=varargin{4}*B;
    end

%% ���
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