% learning f/1
% clauses: 1
% clauses: 2
%time,0.000000
f(A):-has_car(A,B),f_1(A,B).
f_1(A,B):-three_wheels(B),has_car(A,C),has_car(A,C).
