clear all,clc
n=6
x=[1 0 1 0 1 0];
h=[1 1 1 1 1 1];
while size(x)<2^n
   x(size(x)+1)=0;
end
while size(h)<2^n
   h(size(h)+1)=0;
end
N=1:2^n;
a=fft(x)
b=fft(h)
d=a.*b;
e=ifft(d)
plot(N,a)
hold on
plot(N,b)
plot(N,e)
hold off


