% =whos= for Emacs
% :PROPERTIES:
% :header-args:matlab+: :tangle src/whosEmacs.m
% :END:

function whosEmacs(variable)
  disp('<EMACSCAP>(*MATLAB Whos*)');
  try
    if nargin == 1 && ischar(variable)
      evalin('base', ['whos ', variable]);
    else
      evalin('base', 'whos');
    end
  catch ERR
      disp(ERR)
  end
  disp('</EMACSCAP>');
end
