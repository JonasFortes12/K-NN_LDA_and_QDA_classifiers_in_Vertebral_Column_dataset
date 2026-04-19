function y_pred = qda(X_train, Y_train, x_test)
  % QDA Performs Quadratic Discriminant Analysis classification
  % for a single test sample.
  %
  %   y_pred = QDA(X_train, Y_train, x_test) returns the predicted class
  %   label for the input sample x_test using parameters estimated from
  %   the training dataset.
  %
  %   Inputs:
  %     X_train - Training data matrix (N x d)
  %     Y_train - Training label vector (N x 1)
  %     x_test  - Test sample (1 x d)
  %
  %   Output:
  %     y_pred  - Predicted class label for x_test

  classes = unique(Y_train);
  num_classes = length(classes);
  num_features = size(X_train, 2);

  scores = zeros(num_classes, 1);

  for i = 1:num_classes
    c = classes(i);
    Xc = X_train(Y_train == c, :);

    % Estimate class mean
    mu = mean(Xc, 1);

    % Estimate class covariance matrix
    Sigma = cov(Xc);

    % Regularization for numerical stability
    Sigma = Sigma + 1e-6 * eye(num_features);

    prior = size(Xc, 1) / size(X_train, 1);

    diff = x_test - mu;

    scores(i) = -0.5 * log(det(Sigma)) ...
                -0.5 * diff * inv(Sigma) * diff' ...
                + log(prior);
  end

  [~, idx] = max(scores);
  y_pred = classes(idx);
end
