% HW6
%% 1
glass = imread('glass.png');
mysuperpix(glass,500);
%% 2
elk = imread('elk.png');
fish = imread('fish.png');
imageSegmenter;
%% 3
tomatoes = imread('tomatoes.png');
Rt = 195;
Gt = 75;
Bt = 25;
BW = false(size(tomatoes,1),size(tomatoes,2),size(tomatoes,3));
BW(tomatoes(:,:,1) > Rt & tomatoes(:,:,2) > Gt & tomatoes(:,:,3) > Bt) = true;

BW1 = imopen(BW, strel('diamond',4));
BW2 = imclose(BW1, strel('diamond',9));
stats = regionprops(BW2);
centroids = cat(1,stats.Centroid);

imshow(tomatoes);
hold on;
plot(centroids(:,1),centroids(:,2),'g*');
hold off;
%% 4
buttons = imread('buttons.png');
BW1 = im2bw(buttons,180/256.);
BW2 = bwfill(BW1,'holes');
BW3 = im2bw(BW2 - BW1);
stats = regionprops('table',BW3,'Centroid','MajorAxisLength','MinorAxisLength');
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
indicies = find(radii < 8);
radii(indicies) = NaN;
centers(indicies) = NaN;
imshow(BW3);
hold on
viscircles(centers,radii);
hold off
%% 5
% a
d3 = strel('disk',3);
% b
drink = imread('drink.png');
drink2 = imerode(drink,d3);
% c
drink3 = imdilate(drink2,d3);
% d
drink4 = imerode(imdilate(drink,d3),d3);
