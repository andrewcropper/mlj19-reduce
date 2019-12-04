% learning p47/2
% clauses: 1
% clauses: 2
%time,0.000000
p47(A,B):-p47_1(A,C),p47_1(C,B).
p47_1(A,B):-myreverse(A,C),dropWhile_not_my_number(C,B).
