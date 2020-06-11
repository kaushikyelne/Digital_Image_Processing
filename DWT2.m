% Calling watermark function
watermark('cameraman.tif','ironman.jpg')
function y= watermark(A,B)
%read input image
img=imread(A);
[m n p]=size(img);
subplot(1,3,1)
imshow(img);
title('Original Image');
%Get the dwt2 values of that image using Haar Wavelet
[host_LL,host_LH,host_HL,host_HH]=dwt2(img,'haar');
%Read the signature image
water_mark=imread(B);
%Resize it as same as input image
water_mark=imresize(water_mark,[m n]);
subplot(1,3,2)
imshow(water_mark)
title('Watermark');
%Get the dwt2 values of watermark image using Haar wavelet
[water_mark_LL,water_mark_LH,water_mark_HL,...
    water_mark_HH]=dwt2(water_mark,'haar');
%Taking approximate coefficients of both the images and adding them
water_marked_LL = host_LL + (0.03*water_mark_LL);
%Reconstructing the imagae using inverse dwt transform
water_marked=idwt2(water_marked_LL,host_LH,host_HL,host_HH,'haar');
subplot(1,3,3)
imshow(uint8(water_marked));
title('Watermarked image');
y='Watermarked successfully';
end
