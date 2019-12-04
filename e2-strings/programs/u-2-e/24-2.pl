% learning p24/2
% clauses: 1
% clauses: 2
%time,1.000000
p24(A,B):-p24_1(B,A).
p24_1(A,B):-takeWhile_not_space(B,A).
