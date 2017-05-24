%% ��ʾrgbͼ���R,G,B��������
%
%%


function rgbshow(varargin)
%��ʾRGBԭͼ�񼰸�������ͼ��
%ע�⣺�ڵ��øú���ǰ��ʹ��figure()�����´���
%���磺IΪrgbͼ��,��������ΪIR,IG,IB
%       figure('name','1.�ֱ���ʾR,G,B��������','NumberTitle','off');
%       rgbshow(I);                    % R=IR,G=IG,B=IB
%       figure('name','2.�ı�R,G,B��������','NumberTitle','off');
%       rgbshow(I, 0.3, 0.4, 0.8);     % R=0.3IR,G=0.3IG,B=0.8IB 

%% ����һ������������Ϊrgbͼ������
    if ischar(varargin{1})
        hs=msgbox('�������Ϸ���','֪ͨ','warn');
        ht=findobj(hs,'type','text');
        set(ht,'FontSize',11);
        % �ȴ�ȷ��
        uiwait(hs);
        return 
    end
%% ����ͼ��
    rgb=varargin{1};
%% ����R,G,B
    R=rgb(:,:,1);
    G=rgb(:,:,2);
    B=rgb(:,:,3);
%% �������
    if nargin==4
        R=varargin{2}*R;
        G=varargin{3}*G;
        B=varargin{4}*B;
    end
%% ��ʾ
    subplot(231);imshow(rgb);title('ԭͼ��');
    subplot(232);imshow(cat(3,R,G,B));title('RGB�ϳ�ͼ��');
    if nargin==4    
        subplot(234);imshow(R);title([num2str(varargin{2}),'R����']);
        subplot(235);imshow(G);title([num2str(varargin{3}),'G����']);
        subplot(236);imshow(B);title([num2str(varargin{4}),'B����']);
    else
        subplot(234);imshow(R);title('R����');
        subplot(235);imshow(G);title('G����');
        subplot(236);imshow(B);title('B����'); 
    end