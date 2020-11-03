% =eval= for Emacs
% :PROPERTIES:
% :header-args:matlab+: :tangle src/evalEmacs.m
% :END:

function evalEmacs(command)
  if nargin == 1 && ischar(command)
    disp(['<EMACSCAP>(*' command '*)']);
    try
      evalin('base', command);
    catch ERR
      disp(ERR)
    end
    disp('</EMACSCAP>');
end
