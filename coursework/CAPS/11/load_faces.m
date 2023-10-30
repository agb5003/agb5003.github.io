% load_faces.m
% load all faces in a specified directory
face_dir = "att_faces";
num_persons = 40;
num_imgs_each = 10;
num_imgs = num_imgs_each*num_persons;
X = zeros(num_imgs, 92*112);
for i=1:num_persons,
  for j=1:num_imgs_each,
    filename = sprintf("%s/s%d/%d.pgm", face_dir, i, j);
    imgs = imread(filename);
    X((i-1)*num_imgs_each+j, :) = reshape(imgs,[92*112,1]);
  end
end
