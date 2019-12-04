% learning p43/2
% clauses: 1
% clauses: 2
%time,1.000000
p43(A,B):-p43_1(B,A).
p43_1(A,B):-takeWhile_not_space(B,A).
