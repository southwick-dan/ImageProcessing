function  [E1,E2,E3,E4,E5] =  my_entropy_value(X)

%3.1
E1=my_entropy(X); 

% 3.2
pic2add=reshape(X',2,[]);
pic2freq=double(zeros(1,length(pic2add)/2));
pic2freq=double(pic2add(1,:))*256+double(pic2add(2,:))
E2=my_entropy(pic2freq)/2;

%3.3
pic3add=reshape(X,2,[]);
pic3freq=double(zeros(1,length(pic3add)/2));
pic3freq=double(pic3add(1,:))*256+double(pic3add(2,:));
E3=my_entropy(pic3freq)/2;

%3.4
pic4 = reshape(X',1,[]);
pic4q=pic4(2:end);
pic4freq=double(pic4q)-double(pic4(1:length(pic4)-1));
E4=my_entropy(pic4freq);

%3.5
pic5 = reshape(X,1,[]);
pic5q=pic5(2:end);
pic5freq=double(pic5q)-double(pic5(1:length(pic5)-1));
E5=my_entropy(pic5freq);




