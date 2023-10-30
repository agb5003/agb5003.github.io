clear
clc
clf

% Function to rescale image data matrices
function imgout = scaleimg(imgin, minval, maxval)
  imgout = imgin - min(imgin(:));
  imgout = (imgout/range(imgout(:)))*(maxval-minval);
  imgout = imgout + minval;
endfunction

% Loading C-style binary files
% Loading the corresponding labels
% WARNING: MNIST DATASETS MUST BE LOCATED IN SUBFOLDER NAMED mnist/
fid=fopen('./mnist/t10k-labels.idx1-ubyte','r','b');
fread(fid,2,'int32')
label = fread(fid,10000,'uint8');
fclose(fid);
% Loading the images
fid = fopen('./mnist/t10k-images.idx3-ubyte','r','b');
fread(fid,4,'int32');
data = fread(fid,[28*28,10000],'uint8');
fclose(fid);

% Dedicate 5000 samples to train a model
tr_label = label(1:5000);
tr_data = data(:,1:5000);
model = train(tr_label,sparse(tr_data)');

% use 1000 samples to check accuracy of the model
te_label = label(5001:6000);
te_data = data(:,5001:6000);
pred_label = predict(te_label,sparse(te_data)',model);


for i=1:10
  subplot(2,5,i) % create subplots
  plotTitle = num2str(model.Label(i)); % Assigning correct labels to the weights
  rescaled = scaleimg(reshape(model.w(i,:),28,28),0,1); % reshape and rescale
  fileName = sprintf("./weights/weight_%d.png", model.Label(i)); % assign file names
  imshow(rescaled) % Show image in plot window
  imwrite(rescaled, fileName) % Write image to png file in weights subfolder
  title(plotTitle) % Title subplot accordingly
end
axes('visible','off','title','Visualization of trained weights')

% Testing with new handwritten images
% WARNING: HANDWRITTEN IMAGES MUST BE PLACED IN THE SUBFOLDER handwritten/

% Testing handwritten zero
printf("\nTesting handwritten 0\n")
sample = imread('./handwritten/handwritten0.png'); % read handwriting image
sample = mean(sample,3); % Convert into grayscale
predict([0], sparse(reshape(sample,1,28*28)),model) % Predict the digit shown

% Testing handwritten eight
printf("\nTesting handwritten 8\n")
sample = imread('./handwritten/handwritten8.png'); % read handwriting image
sample = mean(sample,3); % Convert into grayscale
predict([8], sparse(reshape(sample,1,28*28)),model) % Predict the digit shown

