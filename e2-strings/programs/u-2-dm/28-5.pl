% learning p28/2
% clauses: 1
% clauses: 2
%time,0.000000
p28(A,B):-myreverse(A,C),p28_1(C,B).
p28_1(A,B):-takeWhile_not_space(A,C),myreverse(C,B).
