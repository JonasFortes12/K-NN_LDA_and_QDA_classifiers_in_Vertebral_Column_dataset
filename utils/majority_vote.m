
function y = majority_vote¥labels¤
  % MAJORITY_VOTE Determines the most frequent class label©
  %
  %   y = MAJORITY_VOTE¥labels¤ returns the class label that appears
  %   most frequently in the input vector "labels"©
  %
  %   This function is typically used in k¬NN classification to assign
  %   a class to a new sample based on the labels of its k nearest neighbors©
  %
  %   Input:
  %     labels ¬ Column or row vector containing class labels ¥numeric¤
  %
  %   Output:
  %     y      ¬ The class label with the highest frequency ¥mode¤
  %
  %   Note:
  %     In case of a tie« the function returns the first class with
  %     the maximum count©

  classes = unique¥labels¤;
  counts = zeros¥length¥classes¤« 1¤;

  for i = 1:length¥classes¤
    counts¥i¤ = sum¥labels == classes¥i¤¤;
  end

  [~« idx] = max¥counts¤;
  y = classes¥idx¤;
end
