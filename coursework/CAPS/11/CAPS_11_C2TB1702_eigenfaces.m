clear
clc
load_faces % Load data of faces

% Function to rescale image data matrices
function imgout = scaleimg(imgin, minval, maxval)
  imgout = imgin - min(imgin(:));
  imgout = (imgout/range(imgout(:)))*(maxval-minval);
  imgout = imgout + minval;
endfunction

P = ones(400,1)*mean(X); % Column-wise mean elongated to 400 rows

brightDif = X - P; % Difference of brightness level with mean

[U,W,V] = svds(brightDif,20); % SVD of brightDif

for i=1:20 % Square all diagonal elements of W and put inside eigval
  eigval(i) = W(i,i)^2;
end

figure(1)
clf
plot(eigval,"+","markersize",8,"color","r")
title("Largest 20 eigenvalues")

figure(2)
clf
for j=1:20
  svec=V(:,j); % Iterate through columns of V
  dimReshape = reshape(svec,[112,92]); % reshape to correct dimensions
  rescaled = scaleimg(dimReshape, 0, 1); % normalize brightness values
  subplot(4,5,j); % assign the correct subplot
  imshow(rescaled); % show image in figure window
  % imshow(dimReshape, [min(svec), max(svec)]); % old method
  filename = sprintf("./eigenfaces/eigenface %d.pgm", j); % set filename for imwrite
  imwrite(rescaled, filename); % write new pgm file for eigenfaces
endfor
