% learning p4/2
% clauses: 1
% clauses: 2
%time,3.000000
p4(A,B):-p4_1(B,A).
p4_1(A,B):-dropLast(B,A).
