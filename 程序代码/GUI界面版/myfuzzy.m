%% ģ��ͼ����ǿ
function I=myfuzzy(X)
[M,N]=size(X);
x1=double(X);
% ��������
Fd=0.8;
FD=-1*Fd;
Fe=128;
Xmax=255;
% ģ������ƽ��
for i=1:M
    for j=1:N
        P(i,j)=(1+(Xmax-x1(i,j))/Fe)^FD;
    end
end
figure,imshow(P);title('ģ����ǿ P');
% ģ����ǿ
for i=1:M
    for j=1:N
        if P(i,j) <= 0.8000
            P1(i,j)=2*P(i,j)^2;
        else
            P1(i,j)=1-2*(1-P(i,j))^2;
        end
    end
end
    P=P1;
figure,imshow(P);title('ģ����ǿ P1');
% ��ģ����
for i=1:M
    for j=1:N
        I(i,j)=Xmax-Fe*((1/P(i,j))^(1/Fd)-1);
    end
end
I=uint8(I);
