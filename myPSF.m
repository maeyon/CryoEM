function I_PSF = myPSF(I_C, sigma)
% Filter the image with a Gaussian filter with standard deviation of 2.
I_PSF=imgaussfilt(I_C, sigma);%H=fspecial('gaussian', 2, sigma);I_PSF=imfilter(I_C,H,'replicate');%Another Method
end