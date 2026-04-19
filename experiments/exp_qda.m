function results = exp_qda(X, Y)
  % EXP_QDA Runs QDA classification using leave-one-out validation.
  %
  %   results = EXP_QDA(X, Y) evaluates the QDA classifier using
  %   leave-one-out cross-validation.
  %
  %   Inputs:
  %     X - Feature matrix (N x d)
  %     Y - Label vector (N x 1)
  %
  %   Output:
  %     results - Struct containing predictions, accuracy, and confusion matrix

  n = size(X, 1);
  Y_pred = zeros(n, 1);

  for i = 1:n
    % Define train/test split
    test_idx = i;
    train_idx = [1:i-1, i+1:n];

    X_train = X(train_idx, :);
    Y_train = Y(train_idx);

    X_test = X(test_idx, :);

    % Normalize using training data only
    [X_train_n, X_test_n] = normalize_train_test(X_train, X_test);

    % Predict using QDA
    Y_pred(i) = qda(X_train_n, Y_train, X_test_n);
  end

  accuracy = sum(Y_pred == Y) / n;
  C = confusion_matrix(Y, Y_pred, length(unique(Y)));

  results.Y_pred = Y_pred;
  results.accuracy = accuracy;
  results.confusion_matrix = C;
end