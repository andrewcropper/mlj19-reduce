% learning p48/2
% clauses: 1
% clauses: 2
% clauses: 3
%time,3.000000
p48(A,B):-myreverse(A,C),p48_1(C,B).
p48_1(A,B):-dropWhile_not_letter(A,C),p48_2(C,B).
p48_2(A,B):-takeWhile_letter(A,C),myreverse(C,B).
