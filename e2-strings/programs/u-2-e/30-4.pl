% learning p30/2
% clauses: 1
% clauses: 2
%time,1.000000
p30(A,B):-p30_1(B,A).
p30_1(A,B):-filter_uppercase(B,A).
