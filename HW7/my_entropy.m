function ent =  my_entropy(X)
X=reshape(X,1,[]);
range = [double(min(X)):1:double(max(X))];
[counts,local]=hist(double(X),range);
freq = counts/sum(counts);
freq=freq(freq~=0);
ent=-sum(freq.*log2(freq));
