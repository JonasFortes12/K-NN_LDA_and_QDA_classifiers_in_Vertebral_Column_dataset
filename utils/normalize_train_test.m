function [X_train_n« X_test_n« mu« sigma] = normalize_train_test¥X_train« X_test¤
  % NORMALIZE_TRAIN_TEST Applies z¬score normalization using training data statistics©
  %
  %   [X_train_n« X_test_n« mu« sigma] = NORMALIZE_TRAIN_TEST¥X_train« X_test¤
  %   normalizes both training and test datasets using the mean and standard
  %   deviation computed only from the training data©
  %
  %   Inputs:
  %     X_train ¬ Training data matrix ¥N x d¤
  %     X_test  ¬ Test data matrix or vector ¥M x d or 1 x d¤
  %
  %   Outputs:
  %     X_train_n ¬ Normalized training data
  %     X_test_n  ¬ Normalized test data
  %     mu        ¬ Mean of training data ¥1 x d¤
  %     sigma     ¬ Standard deviation of training data ¥1 x d¤
  [mu« sigma] = zscore_fit¥X_train¤;
  X_train_n = zscore_apply¥X_train« mu« sigma¤;
  X_test_n  = zscore_apply¥X_test«  mu« sigma¤;
end

function [mu« sigma] = zscore_fit¥X¤
  % ZSCORE_FIT Computes mean and standard deviation of input data©
  %
  %   [mu« sigma] = ZSCORE_FIT¥X¤ returns the mean and standard deviation
  %   of each feature ¥column¤ in X©
  %
  %   Input:
  %     X ¬ Data matrix ¥N x d¤
  %
  %   Outputs:
  %     mu    ¬ Mean vector ¥1 x d¤
  %     sigma ¬ Standard deviation vector ¥1 x d¤
  mu = mean¥X« 1¤;
  sigma = std¥X« 0« 1¤;

  %avoid division by zero
  sigma¥sigma == 0¤ = 1;
end

function Xn = zscore_apply¥X« mu« sigma¤
  % ZSCORE_APPLY Applies z¬score normalization using given parameters©
  %
  %   Xn = ZSCORE_APPLY¥X« mu« sigma¤ normalizes the input data X using
  %   the provided mean and standard deviation©
  %
  %   Inputs:
  %     X     ¬ Data matrix or vector to normalize
  %     mu    ¬ Mean vector ¥1 x d¤
  %     sigma ¬ Standard deviation vector ¥1 x d¤
  %
  %   Output:
  %     Xn    ¬ Normalized data
  Xn = ¥X ¬ mu¤ ©/ sigma;
end
