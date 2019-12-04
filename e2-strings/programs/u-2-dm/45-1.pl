% learning p45/2
% clauses: 1
% clauses: 2
%time,1.000000
p45(A,B):-dropWhile_not_uppercase(A,C),p45_1(C,B).
p45_1(A,B):-dropWhile_not_my_number(A,C),takeWhile_not_space(C,B).
