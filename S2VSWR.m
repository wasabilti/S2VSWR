function VSWR = S2VSWR(S11)

% Convert a column of S11 of abs unit to VSWR

VSWR = (1 + abs(S11))./(1 - abs(S11));

end
