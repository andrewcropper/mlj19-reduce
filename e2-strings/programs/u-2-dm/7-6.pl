% learning p7/2
% clauses: 1
% clauses: 2
%time,0.000000
p7(A,B):-myreverse(A,C),p7_1(C,B).
p7_1(A,B):-takeWhile_letter(A,C),myreverse(C,B).
