function show_confusion_matrix(C, classnames, plot_title)
  % SHOW_CONFUSION_MATRIX Plots a confusion matrix.
  %
  %   SHOW_CONFUSION_MATRIX(C, classnames, plot_title)
  %   creates a visual plot.
  %
  %   Inputs:
  %     C          - Confusion matrix
  %     classnames - Cell array with class names
  %     plot_title - Title for the figure

  num_classes = length(classnames);

  % Plot confusion matrix
  figure;
  imagesc(C);
  colorbar;
  axis equal;
  axis tight;

  title(plot_title, "Interpreter", "none");
  xlabel("Predicted Class");
  ylabel("True Class");

  set(gca, "XTick", 1:num_classes);
  set(gca, "YTick", 1:num_classes);
  set(gca, "XTickLabel", classnames);
  set(gca, "YTickLabel", classnames);

  % Write values inside cells
  for i = 1:num_classes
    for j = 1:num_classes
      text(j, i, num2str(C(i, j)), ...
        "HorizontalAlignment", "center", ...
        "Color", "w", ...
        "FontWeight", "bold");
    end
  end
end