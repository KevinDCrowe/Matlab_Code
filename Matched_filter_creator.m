x = [0 1 1 0 1 1 1 0; 0 1 1 0 1 1 0 0;0 0 0 1 0 1 0 0; 0 1 1 1 0 1 1 0;0 1 1 0 1 1 1 0;0 1 1 0 1 1 1 0; 0 1 1 1 0 1 1 0; 0 1 1 1 0 1 1 0]
a=[1 1 1 1]    

h = [0 1 1 0 1 1 1 0]
N = size(h)
n = N(2)
hi= 1:n
j=1
while j<n+1
    hi(j)=h(n+1-j);
    j=j+1;
end
j=1;
r=0;
while j<5
    f=filter(hi,1,x(:,j))
    i=1
while i<5
    r=f(i)+r
    i=i+1;
end
a(j)=r;
r=0
j=j+1;
end
a