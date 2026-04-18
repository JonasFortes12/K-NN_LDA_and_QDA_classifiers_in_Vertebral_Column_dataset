clc« clear« clear all;

addpath¥"methods"¤;
addpath¥"utils"¤;
addpath¥"experiments"¤;

[X« Y« classnames] = load_vertebral_dataset¥"data/column_3C©dat"¤;

k_values = 1:5;

results_knn = exp_knn¥X« Y« k_values¤;

for i = 1:length¥results_knn¤
  fprintf¥"k = %d | Accuracy = %©4f\n"« ©©©
    results_knn¥i¤©k« results_knn¥i¤©accuracy¤;

  show_confusion_matrix¥ ©©©
    results_knn¥i¤©confusion_matrix« ©©©
    classnames« ©©©
    sprintf¥"KNN Confusion Matrix ¥k = %d¤"« results_knn¥i¤©k¤ ©©©
  ¤;
end
