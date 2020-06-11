clc;clear;close all;
%Load the image
img = imread('cameraman.tif');
[m,n] = size(img);
cimg = [zeros(m,1),img,zeros(m,1)];
rimg = [zeros(1,n+2);cimg;zeros(1,n+2)];
fimg = uint8(zeros(m,n));
%Creating new image matrix
for i = 2:m
    for j = 2:n
        fimg(i-1,j-1) = get_val(i,j,rimg);
    end
end
subplot(121)
imshow(img)
title('Original Image');
subplot(122)
imshow(fimg)
title('Modified image')