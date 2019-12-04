% learning p40/2
% clauses: 1
% clauses: 2
% clauses: 3
%time,4.000000
p40(A,B):-dropWhile_not_space(A,C),p40_1(C,B).
p40_1(A,B):-p40_2(A,C),p40_2(C,B).
p40_2(A,B):-tail(A,C),dropLast(C,B).
