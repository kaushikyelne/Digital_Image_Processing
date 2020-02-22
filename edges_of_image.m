clc;clear;close all;
I = imread('cameraman.tif');
imshow(I)
[m,n] = size(I) ;
J = imresize(I, [512 512]); 

BW1 = edge(J,'sobel');
BW2 = edge(J,'canny');
figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                   Canny Filter');