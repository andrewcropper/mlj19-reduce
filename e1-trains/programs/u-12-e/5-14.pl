% learning f/1
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
% clauses: 5
%time,40.000000
f(A):-has_car(A,B),f_1(A,B).
f_1(A,B):-f_2(A),f_2(B).
f_2(A):-has_load(A,B),f_3(A,B).
f_2(A):-has_car(A,B),has_car(A,B).
f_3(A,B):-long(A),circle(B).
