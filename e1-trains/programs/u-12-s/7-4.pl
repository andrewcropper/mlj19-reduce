% learning f/1
% clauses: 1
% clauses: 2
% clauses: 3
%time,90.000000
f(A):-has_car(A,B),f_1(A,B).
f_1(A,B):-has_load(B,C),has_car(A,D),has_car(A,D),f_2(B,C).
f_2(A,B):-roof_open(A),zero_load(B).
