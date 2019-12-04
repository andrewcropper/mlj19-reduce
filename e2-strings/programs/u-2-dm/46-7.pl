% learning p46/2
% clauses: 1
% clauses: 2
% clauses: 3
%time,4.000000
p46(A,B):-myreverse(A,C),p46_1(C,B).
p46_1(A,B):-dropWhile_not_my_number(A,C),p46_2(C,B).
p46_2(A,B):-takeWhile_not_space(A,C),myreverse(C,B).
