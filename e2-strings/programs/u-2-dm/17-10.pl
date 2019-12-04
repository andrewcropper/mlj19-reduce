% learning p17/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
%time,319.000000
p17(A,B):-myreverse(A,C),p17_1(C,B).
p17_1(A,B):-takeWhile_my_number(A,C),p17_2(C,B).
p17_2(A,B):-myreverse(A,C),p17_3(C,B).
p17_3(A,B):-tail(A,C),tail(C,B).
