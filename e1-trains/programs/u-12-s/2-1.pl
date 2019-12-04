
true.

% learning f/1
% clauses: 1
% clauses: 2
f(A):-has_car(A,B),f_1(A,B).
f_1(A,B):-short(B),has_car(A,C),has_car(A,C).
%time,1.5571198463439941