function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% 采用的是两层循环遍历C和α的所有可能的值，最终求出最优值。
vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
C = 0.01;
sigma = 0.01;
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
predictions = svmPredict(model,Xval);
meanMin = mean(double(predictions ~= yval));
C_optimal = C;
sigma_optimal = sigma;
for i = 1:length(vec)
    for j = 1:length(vec)
        C = vec(i);
        sigma = vec(j);
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
        predictions = svmPredict(model,Xval);
        if(meanMin >= mean(double(predictions ~= yval)))
            meanMin = mean(double(predictions ~= yval));
            C_optimal = C;
            sigma_optimal = sigma;
        end
    end
end
C = C_optimal;
sigma = sigma_optimal;





% =========================================================================

end
