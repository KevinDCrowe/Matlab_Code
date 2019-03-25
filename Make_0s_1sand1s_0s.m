x=[1 0 1 0 1 0]
h=[1 0 1 0 1 0]
i=1
N=size(x)
while i<N(2)+1
    if h(i)==1
        h(i)=0
    
    else
        h(i)=1
        
    end
    i=i+1
end




y=ones(6)

%for i<N+1
%    for j<N+1
%        x(j