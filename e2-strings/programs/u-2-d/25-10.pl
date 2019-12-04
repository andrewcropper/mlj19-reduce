% learning p25/2
% clauses: 1
%time,0.000000
p25(A,B):-dropWhile_not_letter(A,C),takeWhile_letter(C,B).
