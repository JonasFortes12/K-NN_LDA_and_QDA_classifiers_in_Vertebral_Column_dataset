function C = confusion_matrix(Y_true, Y_pred, num_classes)
  % CONFUSION_MATRIX Computes the confusion matrix
  %
  %   C = CONFUSION_MATRIX(Y_true, Y_pred, num_classes) returns a
  %   num_classes x num_classes matrix C, where C(i, j) is the number
  %   of samples whose true class is i and predicted class is j
  %
  %   Inputs:
  %     Y_true      - Vector of true class labels
  %     Y_pred      - Vector of predicted class labels
  %     num_classes - Total number of classes
  %
  %   Output:
  %     C           - Confusion matrix

  C = zeros(num_classes, num_classes);

  for i = 1:length(Y_true)
    true_class = Y_true(i);
    pred_class = Y_pred(i);

    C(true_class, pred_class) = C(true_class, pred_class) + 1;
  end
end