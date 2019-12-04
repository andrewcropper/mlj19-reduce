% learning p15/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
%time,224.000000
p15(A,B):-p15_1(A,C),p15_1(C,B).
p15(A,B):-p15_1(A,B),filter_not_uppercase(A,B).
p15_1(A,B):-p15_2(A,C),p15_2(C,B).
p15_2(A,B):-dropWhile_letter(A,C),tail(C,B).
