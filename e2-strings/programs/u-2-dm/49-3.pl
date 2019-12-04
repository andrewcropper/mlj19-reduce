% learning p49/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
%time,242.000000
p49(A,B):-tail(A,C),p49_1(C,B).
p49_1(A,B):-p49_2(A,C),p49_2(C,B).
p49_2(A,B):-dropLast(A,C),p49_3(C,B).
p49_3(A,B):-dropWhile_letter(A,C),dropWhile_not_letter(C,B).
