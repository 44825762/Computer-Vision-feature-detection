% Attention: ORB algorithm needs plenty of memory usage.
% I recommend you use 32G memory, because I tested the algorithm on a MAC with 16G memory
% and it does not work.
% If you have any problem with running this algorithm on your computer, I 
% can take my MAC to your office and show you the result.
% By the way, I saved the resulting image in the "result set" folder in case
% you need them.

function [pos2]=find_matches(I1,pos1,I2)

% Calculate the features in two images by ORB algorithm.
% Although, ORB needs plenty of time and memory, it has the highest
% quantity of feature detect among BRISK, SURF, SIFT, AKAZE and KAZE.

% Reference:
% Karami, E., Prasad, S. and Shehata, M., 2017. Image matching using SIFT, 
% SURF, BRIEF and ORB: performance comparison for distorted images. arXiv 
% preprint arXiv:1710.02726.

% Tareen, S.A.K. and Saleem, Z., 2018, March. A comparative analysis of 
% sift, surf, kaze, akaze, orb, and brisk. In 2018 International Conference 
% on Computing, Mathematics and Engineering Technologies (iCoMET) (pp. 1-10). IEEE.
detector1 = detectORBFeatures(I1); 
detector2 = detectORBFeatures(I2); 

% Extracted feature vectors, also known as descriptors, and their 
% corresponding locations, from a intensity image.

% The function "extractFeatures" derives the descriptors from pixels 
% surrounding an interest point. The pixels represent and match features 
% specified by a single-point location. Each single-point specifies the 
% center location of a neighborhood. The method you use for descriptor 
% extraction depends on the class of the input points.
[features1,valid_points1] = extractFeatures(I1,detector1);
[features2,valid_points2] = extractFeatures(I2,detector2);

% Match the features between two images, and return the index of matched feature.
indexPairs = matchFeatures(features1,features2);

% Retrieve the locations of the corresponding points for each image.
% matchedPoints1 and matchedPoints1 are the coordinates of matched feature
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

% Remove the erroneous matches between the two images.
% The function excludes outliers using the M-estimator SAmple Consensus (MSAC) algorithm. 
% The MSAC algorithm is a variant of the Random Sample Consensus (RANSAC) algorithm. 
% Results may not be identical between runs because of the randomized nature 
% of the MSAC algorithm.

% inlierpoints1 and inlierpoints2 are inlier points, returned as the same
% type as the input matching points.

% Reference:
% Mathworks.(2019). estimateGeometricTransform Retrieved 23/11, 2019, 
% from https://ww2.mathworks.cn/help/vision/ref/estimategeometrictransform.html?searchHighlight=estimateGeometricTransform
[tform, inlierpoints1, inlierpoints2] = estimateGeometricTransform(matchedPoints1, matchedPoints2, 'projective');

% Applies the forward transformation of tform to the input coordinate 
% matrix pos1 and returns the coordinate matrix pos2. 
% TransformPointsForward maps the kth point pos1(k,:) to the point pos2(k,:).
pos2 = transformPointsForward(tform, pos1);
figure(1); 

% Visualize the corresponding points. 
showMatchedFeatures(I1,I2,inlierpoints1,inlierpoints2);
% If you want to use two image side by side, you can use this parameter.
%showMatchedFeatures(I1,I2,inlierpoints1,inlierpoints2,'montage');

end













