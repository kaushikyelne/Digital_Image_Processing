clc;clear;close all;
I = imread('cameraman.tif');
kernel = [-1 -1 -1;-1 8 -1;-1 -1 -1];%HPF
kernel2 = 1/9 *([1,1,1;1,1,1;1,1,1]);%LPF
LPF_Image = imfilter(I, kernel2, 'same');
HPF_Image = imfilter(I, kernel, 'same');
imshowpair(LPF_Image,HPF_Image,'montage');
title('Low Pass Filter                                   High Pass Filter');