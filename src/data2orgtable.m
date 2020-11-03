% Documentation

function [strarray] = data2orgtable(data, labels_row, labels_col, str_format)

% Initialize parameters

if nargin == 3
  str_format = ' %.1f ';
end

strarray = '';

% One label for each row and each column

if length(labels_col) == size(data, 2) && length(labels_row) == size(data, 1)
  strarray = [strarray, ' | ', strjoin(labels_col, ' | '), sprintf('\n')];
  for rowi = 1:size(data, 1)
    strarray = [strarray, labels_row{rowi}, ' | ', strjoin(strsplit(num2str(data(rowi, :), str_format)), ' | '), sprintf('\n')];
  end

% First columns label corresponds to the label for the rows

elseif length(labels_col) == size(data, 2)+1  && length(labels_row) == size(data, 1)
  strarray = [strarray, strjoin(labels_col, ' | '), sprintf('\n')];
  for rowi = 1:size(data, 1)
    strarray = [strarray, labels_row{rowi}, ' | ', strjoin(strsplit(num2str(data(rowi, :), str_format)), ' | '), sprintf('\n')];
  end

% Labels only for the columns

elseif length(labels_col) == size(data, 2) && length(labels_row) == 0
  strarray = [strarray, strjoin(labels_col, ' | '), sprintf('\n')];
  for rowi = 1:size(data, 1)
    strarray = [strarray, strjoin(strsplit(num2str(data(rowi, :), str_format)), ' | '), sprintf('\n')];
  end

% First row label corresponds to the label for the columns

elseif length(labels_row) == size(data, 1)+1  && length(labels_col) == size(data, 2)
  strarray = [strarray, labels_row{1}, ' | ', strjoin(labels_col, ' | '), sprintf('\n')];
  for rowi = 1:size(data, 1)
    strarray = [strarray, labels_row{rowi+1}, ' | ', strjoin(strsplit(num2str(data(rowi, :), str_format)), ' | '), sprintf('\n')];
  end

% Labels only for the rows

elseif length(labels_row) == size(data, 1) && length(labels_col) == 0
  for rowi = 1:size(data, 1)
    strarray = [strarray, labels_row{rowi}, ' | ', strjoin(strsplit(num2str(data(rowi, :), str_format)), ' | '), sprintf('\n')];
  end

% No labels, only data

elseif length(labels_row) == 0 && length(labels_col) == 0
  for rowi = 1:size(data, 1)
    strarray = [strarray, strjoin(strsplit(num2str(data(rowi, :), str_format)), ' | '), sprintf('\n')];
  end
end

% Remove the last new line

strarray(end) = [];
