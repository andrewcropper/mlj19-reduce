% learning p27/2
% clauses: 1
% clauses: 2
% clauses: 3
%time,4.000000
p27(A,B):-myreverse(A,C),p27_1(C,B).
p27_1(A,B):-filter_letter(A,C),p27_2(C,B).
p27_2(A,B):-takeWhile_uppercase(A,C),myreverse(C,B).
