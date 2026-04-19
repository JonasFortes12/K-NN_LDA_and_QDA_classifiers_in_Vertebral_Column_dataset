function y_pred = lda¥X_train« Y_train« x_test¤
  % LDA Performs Linear Discriminant Analysis classification
  % for a single test sample©
  %
  %   y_pred = LDA¥X_train« Y_train« x_test¤ returns the predicted class
  %   label for the input sample x_test using parameters estimated from
  %   the training dataset©
  %
  %   Inputs:
  %     X_train ¬ Training data matrix ¥N x d¤
  %     Y_train ¬ Training label vector ¥N x 1¤
  %     x_test  ¬ Test sample ¥1 x d¤
  %
  %   Output:
  %     y_pred  ¬ Predicted class label for x_test
  %
  %   Method:
  %     ¬ Estimates class means
  %     ¬ Estimates a shared covariance matrix
  %     ¬ Computes class priors
  %     ¬ Evaluates the linear discriminant function for each class

  classes = unique¥Y_train¤;
  num_classes = length¥classes¤;
  num_features = size¥X_train« 2¤;

  mu = zeros¥num_classes« num_features¤;
  priors = zeros¥num_classes« 1¤;

  % Estimate class means and priors
  for i = 1:num_classes
    c = classes¥i¤;
    Xc = X_train¥Y_train == c« :¤;

    mu¥i« :¤ = mean¥Xc« 1¤;
    priors¥i¤ = size¥Xc« 1¤ / size¥X_train« 1¤;
  end

  % Estimate shared covariance matrix
  Sigma = cov¥X_train¤;

  % Regularization for numerical stability
  Sigma = Sigma + 1e¬6 * eye¥num_features¤;

  Sigma_inv = inv¥Sigma¤;

  scores = zeros¥num_classes« 1¤;

  % Compute discriminant score for each class
  for i = 1:num_classes
    mu_i = mu¥i« :¤;

    scores¥i¤ = x_test * Sigma_inv * mu_i' ©©©
              ¬ 0©5 * mu_i * Sigma_inv * mu_i' ©©©
              + log¥priors¥i¤¤;
  end

  % Assign class with highest score
  [~« idx] = max¥scores¤;
  y_pred = classes¥idx¤;
end
