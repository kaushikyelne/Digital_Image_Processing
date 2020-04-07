
%Watermarking based on Bitplane slicing
clc
clear;
close all;
%Reading Original Image
[fn fp]=uigetfile('*.*');
a=rgb2gray(imread([fp,fn]));
[m,n]=size(a);
%Reading The Logo
[fn fp]=uigetfile('*.*');
w=im2bw(rgb2gray(imread([fp,fn])),.6);
figure, imshow(w)
b=dec2bin(a);
b8=b(:,1);
b7=b(:,2);
b6=b(:,3);
b5=b(:,4);
b4=b(:,5);
b3=b(:,6);
b2=b(:,7);
b1=b(:,8);
a8=reshape(str2num(b8),m,n);
a7=reshape(str2num(b7),m,n);
a6=reshape(str2num(b6),m,n);
a5=reshape(str2num(b5),m,n);
a4=reshape(str2num(b4),m,n);
a3=reshape(str2num(b3),m,n);
a2=reshape(str2num(b2),m,n);
a1=reshape(str2num(b1),m,n);
a8(1:size(w,1),1:size(w,2))=w;
figure
subplot(2,5,1),imshow(a1);
subplot(2,5,2),imshow(a2);
subplot(2,5,3),imshow(a3);
subplot(2,5,4),imshow(a4);
subplot(2,5,6),imshow(a5);
subplot(2,5,7),imshow(a6);
subplot(2,5,8),imshow(a7);
subplot(2,5,9),imshow(a8);
dd=num2str(reshape(a8,size(b,1),1));
b(:,1)=dd(:,end);
c=bin2dec(b);
d=reshape(c,size(a,1),size(a,2));
subplot(2,5,10),imshow(uint8(d)),title('WaterMarkedImage');
subplot(2,5,5),imshow(a),title('OriginalImage');
