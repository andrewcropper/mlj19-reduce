% learning f/1
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
% clauses: 5
%time,90.000000
f(A):-has_car(A,B),f_1(A,B).
f_1(A,B):-f_2(A),roof_closed(B).
f_2(A):-has_car(A,B),f_3(A,B).
f_3(A,B):-f_4(A),short(B).
f_4(A):-has_car(A,B),has_car(A,B).
