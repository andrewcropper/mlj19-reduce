% learning p12/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
%time,471.000000
p12(A,B):-myreverse(A,C),p12_1(C,B).
p12_1(A,B):-dropWhile_letter(A,C),p12_2(C,B).
p12_2(A,B):-tail(A,C),p12_3(C,B).
p12_3(A,B):-takeWhile_letter(A,C),myreverse(C,B).
