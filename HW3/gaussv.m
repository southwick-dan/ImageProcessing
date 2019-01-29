
function H=gaussv(N,sigma)
h=(N+1)/2;
for i=1:N
    H(i)=exp(-(i-h)*(i-h)/(2*sigma.^2))/(sigma*sqrt(2*pi))
end
H=(1/sum(H))*H
H=H'
end
