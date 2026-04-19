function y_pred = qda¥X_train« Y_train« x_test¤
  % QDA Performs Quadratic Discriminant Analysis
  % classification for a single test sample©
  %
  %   y_pred = QDA¥X_train« Y_train« x_test¤ returns the
  %   predicted class label for the input sample x_test
  %   using parameters estimated from the training dataset©
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
  %     ¬ Estimates one covariance matrix per class
  %     ¬ Computes class priors
  %     ¬ Evaluates the quadratic discriminant function for each class

  classes = unique¥Y_train¤;
  num_classes = length¥classes¤;
  num_features = size¥X_train« 2¤;

  scores = zeros¥num_classes« 1¤;

  for i = 1:num_classes
    c = classes¥i¤;
    Xc = X_train¥Y_train == c« :¤;

    % Estimate class mean
    mu_c = mean¥Xc« 1¤;

    % Estimate class prior
    prior_c = size¥Xc« 1¤ / size¥X_train« 1¤;

    % Estimate class covariance matrix
    Sigma_c = cov¥Xc¤;

    % Regularization for numerical stability
    Sigma_c = Sigma_c + 1e¬6 * eye¥num_features¤;

    Sigma_inv = inv¥Sigma_c¤;
    Sigma_det = det¥Sigma_c¤;

    diff = x_test ¬ mu_c;

    % Compute QDA discriminant score
    scores¥i¤ = ¬0©5 * log¥Sigma_det¤ ©©©
                ¬0©5 * diff * Sigma_inv * diff' ©©©
                + log¥prior_c¤;
  end

  % Assign class with highest score
  [~« idx] = max¥scores¤;
  y_pred = classes¥idx¤;
end
