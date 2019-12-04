% learning p44/2
% clauses: 1
% clauses: 2
%time,0.000000
p44(A,B):-dropWhile_not_letter(A,C),p44_1(C,B).
p44_1(A,B):-dropWhile_not_my_number(A,C),takeWhile_not_space(C,B).
