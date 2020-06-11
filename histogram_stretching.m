clc;clear;close all;

rd = rgb2gray(imread('ironman.jpg')); %Reading an image

rd = rgb2gray(imread('landscape.jpg')); %Reading an image

[m,n] = size(rd);
[rd,hist1] = deal(double(rd),zeros(1,256));
    %Getting histogram 1 of original image
hist1 = get_hist(rd,m,n,1,0);
mn = zeros(m,2);
for i = 1:m
    %Calculating the minimum and maximum values of all columns row wise
     [mn(i,1),mn(i,2)] = deal(min(rd(i,:)),max(rd(i,:)));
end
%Getting imax and imin values
[imin,imax] = deal(min(mn(:,1)),max(mn(:,2)));
%Stretched limits smax and smin
[smin,smax] = deal(0,255);
s = zeros(imax-imin,3);
for i = imin:1:imax
    s(i+1,1) = i;
    s(i+1,2) =  round(((smax-smin)/(imax-imin))*(i - imin) + smin);
    val = round(((smax-smin)/(imax-imin))*(i - imin) + smin);
    if s(i+1,2) == val
        s(i+1,3) = hist1(1,i+1);
    end    
end
%New intermediate histogram as per histogram stretching
hist2 = zeros(256,1);
for k = 0:255
    for l = imin:imax
        if s(l+1,2) == k
            hist2(k+1) = s(l+1,3);
        end
    end
end
hist2 = hist2';
%Calculate PDF
pdf = hist2 * (1/(m*n));
%Calculate CDF
cdf = zeros(1,256);
cdf = cumsum(pdf);
cdf = round(255*cdf);   %Round off
%Reconstruct the output image from cdf corresponding freq
rn = zeros(1,256);
rn = get_hist(rd,m,n,2,cdf);
%Creating Equalized Histogram after histogram stretching
hist3 = zeros(1,256);
hist3 = get_hist(rn,m,n,1,0);
%Showing the images and plotting the histograms
subplot(121)
imshow(uint8(rd));
title('Original Image')
subplot(122)
imshow(uint8(rn))
title('Modified Image')
figure
subplot(121)
plot(hist2)
title('Normal histogram')
subplot(122)
plot(hist3)
title('Eqalized Stretched Histogram ')