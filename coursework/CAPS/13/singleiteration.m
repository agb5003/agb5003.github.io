clear
clf
clc

% Add DLT to Octave search paths
addpath('dlt/NN')
addpath('dlt/util')

% LOAD ALL DATA
% Load testing images dataset
fid=fopen('./mnist/t10k-images.idx3-ubyte','r','b');
fread(fid,4,'int32');
test_img=fread(fid,[28*28,10000],'uint8');
test_img=test_img';
fclose(fid);
% Load testing labels dataset
fid=fopen('./mnist/t10k-labels.idx1-ubyte','r','b');
fread(fid,2,'int32');
test_lbl=fread(fid,10000,'uint8');
fclose(fid);
% Loading training images dataset
fid=fopen('./mnist/train-images.idx3-ubyte','r','b');
fread(fid,4,'int32');
train_img=fread(fid,[28*28,60000],'uint8');
train_img=train_img';
fclose(fid);
% Loading training labels dataset
fid=fopen('./mnist/train-labels.idx1-ubyte','r','b');
fread(fid,2,'int32');
train_lbl=fread(fid,60000,'uint8');
fclose(fid);

% Data standardization
mu = mean(train_img);
sigma = max(std(train_img), eps);
train_img = (train_img - mu) ./ sigma;
test_img = (test_img - mu) ./ sigma;

% Labeling with one-hot vectors
A = eye(10,10);
train_d = A(train_lbl+1,:);
test_d = A(test_lbl+1,:);

% Initiate neural network
nn = nnsetup([784 100 10]); % Clears prior networks and sets up a new one
opts.numepochs = 1;
opts.batchsize = 100;

% Train neural network then test the accuracy with test dataset
[nn,L] = nntrain(nn, train_img, train_d, opts);
pred = nnpredict(nn,test_img);
accuracy = mean(pred-1 == test_lbl)*100 % Accuracy

