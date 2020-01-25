% Histogram_Equalization
%rd = rgb2gray(imread('cameraman.tif'));
rdi = imread('cameraman.tif');
s = size(rdi);
rdi = double(rdi);

hist1 = zeros(1,256);
for i = 1:s(1)          %Creating histogram of the original image
    for j = 1:s(2)
        for k = 0:255
            if rdi(i,j) == k
                hist1(k+1) = hist1(k+1)+1;
            end
        end
    end
end
%Calculating PDF
pdf = hist1 * (1/(s(1)*s(2)));
%Calculating CDF
cdf = zeros(1,256);
cdf(1) = pdf(1);
for i = 2:255
    cdf(i) = cdf(i-1) + pdf(i);
end
cdf = round(255*cdf);   %Round off
%Reconstructing the output image from cdf corresponding freq
rn = zeros(1,256);
for i = 1:s(1)
    for j = 1:s(2)
          for k = 0:255
              if rdi(i,j) == k
                  rn(i,j) = cdf(k+1);
              end
          end
    end
end
%Creating Equalized Histogram
hist2 = zeros(1,256);
for i = 1:s(1)
    for j = 1:s(2)
        for k = 0:255
            if rn(i,j) == k
                hist2(k+1) = hist2(k+1)+1;
            end
        end
    end
end
subplot(121)
imshow(uint8(rdi));
subplot(122)
imshow(uint8(rn))
figure
subplot(121)
plot(hist1)
subplot(122)
plot(hist2)