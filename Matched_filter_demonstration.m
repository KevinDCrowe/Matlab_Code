W=12 ;%Word size
N=20; %Number of words
xt=zeros((2*W)*N+W);
x=xt(1,:);

h1=[0 -1 0 1 0 -1 0 1 0 -1 0 1]; %1
h2=[0 1 0 -1 0 1 0 -1 0 1 0 -1]; %0

%Input Data%
for i=1:N  
x(2*W*(i-1)+W+1:2*W*(i-1)+2*W)=[0 1 0 -1 0 1 0 -1 0 1 0 -1];
end

for i=2:3  
x(2*W*(i-1)+W+1:2*W*(i-1)+2*W)=[0 -1 0 1 0 -1 0 1 0 -1 0 1];
end

for i=6:7  
x(2*W*(i-1)+W+1:2*W*(i-1)+2*W)=[0 -1 0 1 0 -1 0 1 0 -1 0 1];
end






%Filtering%
xb=1:W;

for i=1:2*N*W
    xb(1:W)=x(W-1+i:-1:i);
    A=0;
    A2=0;
    A3=0;
    for j=1:W
        A=xb(j)*h1(j)+A;
        A2=xb(j)*h2(j)+A2;
    end
    y(i)=A;
    y2(i)=A2;
end
figure(1)
hold on
plot(y,'r')
plot(y2,'b')

%Decision%
if mod(W,2)==1
    a=W+1
else
    a=W+2
end

for i=1:N
    if y(a+2*W*(i-1))>0
        yd(i)=1
    else
        yd(i)=0
    end
end
