% learning p14/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
%time,416.000000
p14(A,B):-myreverse(A,C),p14_1(C,B).
p14_1(A,B):-dropWhile_letter(A,C),p14_2(C,B).
p14_2(A,B):-tail(A,C),p14_3(C,B).
p14_3(A,B):-dropWhile_letter(A,C),myreverse(C,B).
