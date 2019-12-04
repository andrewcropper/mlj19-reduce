% learning f/1
% clauses: 1
% clauses: 2
% clauses: 3
%time,0.000000
f(A):-has_car(A,B),f_1(A,B).
f_1(A,B):-f_2(A),three_wheels(B).
f_2(A):-has_car(A,B),has_car(A,B).
