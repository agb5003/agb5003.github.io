% Read .pgm file and write data to csv file

sus = imread("red.pgm");
csvwrite("matrixred.csv", sus);
