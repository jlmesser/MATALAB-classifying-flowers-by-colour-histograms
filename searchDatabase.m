function closestMatch = searchDatabase (uploadedFile, database, numImages)

%loop, compare uploadedFile with every pic in database

%img = readimage(imds,I)
%imds is image datastore, I is the index

uploadedFile = imread(uploadedFile);
lowestDif = 9999999;
closestMatch = readimage(database,1); 

for pic = 1:numImages 
   img = readimage(database,pic);
   dif = chiSq(uploadedFile, img);
   
   if dif<lowestDif
       lowestDif = dif;
       closestMatch = img;
   end
end

