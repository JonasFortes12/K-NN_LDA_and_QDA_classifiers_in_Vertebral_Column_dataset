function [X, Y, classnames, Y_text] = load_vertebral_dataset(filename)
  % Loads the Vertebral Column dataset
  % Outputs:
  %   X          -> N x 6 matrix of attributes
  %   Y          -> N x 1 vector of numeric labels
  %   classnames -> class names in the order of Y codes
  %   Y_text     -> original labels in text form

  fid = fopen(filename, 'r');
  if fid == -1
    error('Error in open file: %s', filename);
  end

  data = textscan(fid, '%f %f %f %f %f %f %s');
  fclose(fid);

  X = [data{1}, data{2}, data{3}, data{4}, data{5}, data{6}];
  Y_text = data{7};

  % Classes from 3C dataset
  classnames = {'normal', 'diskhernia', 'spondylolisthesis'};
  
  % Init vector
  Y = zeros(length(Y_text), 1);

  for i = 1:length(Y_text)
    label = strtrim(Y_text{i});

    if strcmp(label, 'NO')
      Y(i) = 1;
    elseif strcmp(label, 'DH')
      Y(i) = 2;
    elseif strcmp(label, 'SL')
      Y(i) = 3;
    else
      error('Unknown label in line %d: %s', i, label);
    end
  end
end
