% learning p17/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
%time,554.000000
p17(A,B):-dropWhile_my_number(A,C),p17_1(C,B).
p17_1(A,B):-p17_2(A,C),p17_2(C,B).
p17_2(A,B):-dropWhile_not_my_number(A,C),p17_3(C,B).
p17_3(A,B):-tail(A,C),tail(C,B).
