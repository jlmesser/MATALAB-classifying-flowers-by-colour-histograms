function totalDif = chiSq (pic1, pic2)

%read in pictures
%pic1 = imread('peppers.png');
[rows1, columns1, depth1]=size(pic1);

%pic2 = imread('trees.png');
[rows2, columns2, depth2]=size(pic2);

%make sure both pictures are same size
if rows1>rows2
    biggestRows = rows1;
else
    biggestRows = rows2;
end

if columns1>columns2
    biggestColumns = columns1;
else
    biggestColumns = columns2;
end

resizedImage1 = imresize(pic1,[biggestRows, biggestColumns]);
resizedImage2 = imresize(pic2,[biggestRows, biggestColumns]);

%rgb pic, 3 layers
%compare 3 times? for each layer?

%split pictures into colour channels
red1 = resizedImage1(:,:,1); % Red channel
green1 = resizedImage1(:,:,2); % Green channel
blue1 = resizedImage1(:,:,3); % Blue channel

red2 = resizedImage2(:,:,1); % Red channel
green2 = resizedImage2(:,:,2); % Green channel
blue2 = resizedImage2(:,:,3); % Blue channel

%histograms for first pic
[redHist1,n] = imhist(red1);
redHist1 = redHist1/size(red1,1)/size(red1,2);

[greenHist1,n] = imhist(green1);
greenHist1 = greenHist1/size(green1,1)/size(green1,2);

[blueHist1,n] = imhist(blue1);
blueHist1 = blueHist1/size(blue1,1)/size(blue1,2);

%histograms for second pic
[redHist2,n] = imhist(red2);
redHist2 = redHist2/size(red2,1)/size(red2,2);

[greenHist2,n] = imhist(green2);
greenHist2 = greenHist2/size(green2,1)/size(green2,2);

[blueHist2,n] = imhist(blue2);
blueHist2 = blueHist2/size(blue2,1)/size(blue2,2);

%find distance between colour histograms
redDif = distChiSq( redHist1',redHist2' );
greenDif = distChiSq( greenHist1',greenHist2' );
blueDif = distChiSq( blueHist1',blueHist2' );

%total distance between pictures, accounting for all colours
totalDif = redDif+greenDif+blueDif;





