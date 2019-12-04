% learning f/1
% clauses: 1
% clauses: 2
% clauses: 3
%time,123.000000
f(A):-has_car(A,B),f_1(A,B).
f_1(A,B):-roof_open(B),has_car(A,C),f_2(A,C).
f_2(A,B):-long(B),has_car(A,C),has_car(A,C).
