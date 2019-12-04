% learning f/1
% clauses: 1
% clauses: 2
% clauses: 3
%time,440.000000
f(A):-f_1(A,B),three_wheels(B).
f_1(A,B):-f_2(A,C),has_car(C,B).
f_2(A,B):-has_car(B,C),has_car(A,D),has_car(B,D),has_load(C,E),circle(E).
