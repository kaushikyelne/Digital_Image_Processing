clc; close all; clear;

I = imread('ironman.jpg');

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);

subplot(3,1,1)
imshow(r);
subplot(3,1,2)
imshow(g);
subplot(3,1,3)
imshow(b);