function y_pred = knn(X_train, Y_train, x_test, k)
  % KNN Performs k-Nearest Neighbors classification for a single test sample.
  %
  %   y_pred = KNN(X_train, Y_train, x_test, k) returns the predicted class
  %   label for the input sample x_test based on the k nearest neighbors
  %   from the training dataset.
  %
  %   Inputs:
  %     X_train - Matrix of training samples (N x d), where N is the number
  %               of samples and d is the number of features
  %     Y_train - Vector of training labels (N x 1)
  %     x_test  - Test sample (1 x d)
  %     k       - Number of nearest neighbors to consider
  %
  %   Output:
  %     y_pred  - Predicted class label for x_test
  %

  % Compute Euclidean distances between the test sample and all training samples
  diffs = X_train - x_test;
  dists = sqrt(sum(diffs .^ 2, 2));

  % Sort distances in ascending order and get corresponding indices
  [~, idx] = sort(dists);

  % Select the labels of the k nearest neighbors
  nearest_labels = Y_train(idx(1:k));

  % Assign the class based on majority voting among neighbors
  y_pred = majority_vote(nearest_labels);
end