% I assume that Dr.Michael Spratling has a set of
% "pos1" to test my work, so I set pos1 as [1,1].

I11=rgb2gray(im2double(imread('bikes/img1.png')));
I12=rgb2gray(im2double(imread('bikes/img2.png')));
pos1=[1,1];
find_matches(I11,pos1,I12)

I21=rgb2gray(im2double(imread('ceiling/img1.jpg')));
I22=rgb2gray(im2double(imread('ceiling/img2.jpg')));
pos1=[1,1];
find_matches(I21,pos1,I22);

I31=rgb2gray(im2double(imread('bark/img1.png')));
I32=rgb2gray(im2double(imread('bark/img2.png')));
pos1=[1,1];
find_matches(I31,pos1,I32);

I41=rgb2gray(im2double(imread('day_night/img1.jpg')));
I42=rgb2gray(im2double(imread('day_night/img2.jpg')));
pos1=[1,1];
find_matches(I41,pos1,I42);

I51=rgb2gray(im2double(imread('graffiti/img1.png')));
I52=rgb2gray(im2double(imread('graffiti/img2.png')));
pos1=[1,1];
find_matches(I51,pos1,I52);

I61=rgb2gray(im2double(imread('leuven/img1.png')));
I62=rgb2gray(im2double(imread('leuven/img2.png')));
pos1=[1,1];
find_matches(I61,pos1,I62);

I71=rgb2gray(im2double(imread('semper/img1.jpg')));
I72=rgb2gray(im2double(imread('semper/img2.jpg')));
pos1=[1,1];
find_matches(I71,pos1,I72);

I81=rgb2gray(im2double(imread('trees/img1.png')));
I82=rgb2gray(im2double(imread('trees/img2.png')));
pos1=[1,1];
find_matches(I81,pos1,I82);

I91=rgb2gray(im2double(imread('venice/img1.jpg')));
I92=rgb2gray(im2double(imread('venice/img2.jpg')));
pos1=[1,1];
find_matches(I91,pos1,I92);

I101=rgb2gray(im2double(imread('wall/img1.png')));
I102=rgb2gray(im2double(imread('wall/img2.png')));
pos1=[1,1];
find_matches(I101,pos1,I102)





