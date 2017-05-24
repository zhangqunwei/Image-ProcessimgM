%% rgb��ʽת����hsi��ʽ
%    
%%



function [varargout]=rgb2hsi(varargin)

%% ����һ������������Ϊrgbͼ������
    if ischar(varargin{1})
        hs=msgbox('�������Ϸ���','֪ͨ','warn');
        ht=findobj(hs,'type','text');
        set(ht,'FontSize',11);
        % �ȴ�ȷ��
        uiwait(hs);
        return 
    end
    
%% ��ȡR G B ����
%im2double()��double()����������
%im2double()��ͼ������ת��Ϊdouble���ͺ���������[0 1]������ 
%double() ֻ��������ݾ��ȣ���δ������[0 1]֮��
    rgb=im2double(varargin{1});
    R=rgb(:,:,1);
    G=rgb(:,:,2);
    B=rgb(:,:,3);
    
%% ���� H S I
%
    % ����H
    H_num=(R-G)+(R-B)/2;
    H_den=sqrt((R-G).^2+(R-B).*(G-B));
    H=acos(H_num./(H_den+eps)); % ���eps��������ֹ��ĸΪ��
    H(B>G)=2*pi-H(B>G);    
    H=H/(2*pi);                 % ��H ��Χ��һ��Ϊ[0 1]  
    % ����S
    S_num=min(min(R,G),B);
    S_den=R+G+B;
    S=1-3.*S_num./(S_den+eps);    
    H(S==0)=0;
    % ����I
    I=(R+G+B)/3;
    
%% ���� H S I ��������ϵ��
    if nargin==4
        H=varargin{2}*H;
        S=varargin{3}*S;
        I=varargin{4}*I;
    end  
    % H Ϊ������ȡģ
    H=abs(H);
    
%% ���
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