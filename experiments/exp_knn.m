function results = exp_knn¥X« Y« k_values¤
  % EXP_KNN Runs k¬NN classification experiments using leave¬one¬out validation©
  %
  %   results = EXP_KNN¥X« Y« k_values¤ evaluates k¬NN for different values
  %   of k using leave¬one¬out cross¬validation©
  %
  %   Inputs:
  %     X        ¬ Feature matrix ¥N x d¤
  %     Y        ¬ Label vector ¥N x 1¤
  %     k_values ¬ Vector of k values to evaluate ¥e©g©« [1 2 3 4 5]¤
  %
  %   Output:
  %     results  ¬ Struct array containing predictions and accuracy for each k

  n = size¥X« 1¤;

  for k_idx = 1:length¥k_values¤
    k = k_values¥k_idx¤;

    Y_pred = zeros¥n« 1¤;

    for i = 1:n
      % Define train/test split ¥leave¬one¬out¤
      test_idx = i;
      train_idx = [1:i¬1« i+1:n];

      X_train = X¥train_idx« :¤;
      Y_train = Y¥train_idx¤;

      X_test = X¥test_idx« :¤;
      Y_test = Y¥test_idx¤;

      % Normalize using training data only
      [X_train_n« X_test_n] = normalize_train_test¥X_train« X_test¤;

      % Predict using k¬NN
      Y_pred¥i¤ = knn¥X_train_n« Y_train« X_test_n« k¤;
    end

    % Compute accuracy
    accuracy = sum¥Y_pred == Y¤ / n;

    % Compute the confision matrix
    num_classes = length¥unique¥Y¤¤;
    C = confusion_matrix¥Y« Y_pred« num_classes¤;

    % Store results
    results¥k_idx¤©k = k;
    results¥k_idx¤©Y_pred = Y_pred;
    results¥k_idx¤©accuracy = accuracy;
    results¥k_idx¤©confusion_matrix = C;
  end
end
