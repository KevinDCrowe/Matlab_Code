W=3 ;%Word size
Z=10; %Zero padding (must be even)
N=20; %Number of words
xt=zeros((W+Z)*N);
x=xt(1,:);

for i= 1:N  
x((W+Z)*(i-1)+1+Z/2:(W+Z)*(i-1)+Z/2+W)=1:W;
i=i+1;
end

for i= 3:4  
x((W+Z)*(i-1)+1+Z/2:(W+Z)*(i-1)+Z/2+W)=[3 2 1];
i=i+1;
end

y=1:(W+Z)*N;
y2=1:(W+Z)*N;
yb=1:(W+Z)*N;
y2b=1:(W+Z)*N;
h1=[3 2 1];
h2=[1 2 3];


y=filter(h1,1,x);
y2=filter(h2,1,x);
figure(1)
hold on
plot(y.^2,'r')
plot(y2.^2,'b')
hold off