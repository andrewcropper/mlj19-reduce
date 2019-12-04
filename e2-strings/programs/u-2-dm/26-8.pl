% learning p26/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
%time,232.000000
p26(A,B):-filter_letter(A,C),p26_1(C,B).
p26_1(A,B):-p26_2(A,C),p26_2(C,B).
p26_2(A,B):-tail(A,C),p26_3(C,B).
p26_3(A,B):-dropLast(A,C),dropWhile_not_uppercase(C,B).
