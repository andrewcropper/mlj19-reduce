% learning p33/2
% clauses: 1
% clauses: 2
%time,0.000000
p33(A,B):-dropWhile_not_space(A,C),p33_1(C,B).
p33_1(A,B):-dropWhile_not_letter(A,C),takeWhile_letter(C,B).
