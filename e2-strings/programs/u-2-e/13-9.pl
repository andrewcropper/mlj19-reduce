% learning p13/2
% clauses: 1
% clauses: 2
%time,0.000000
p13(A,B):-p13_1(B,A).
p13_1(A,B):-dropWhile_not_my_number(B,A).
