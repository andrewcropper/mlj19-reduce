% learning p16/2
% clauses: 1
% clauses: 2
%time,2.000000
p16(A,B):-p16_1(B,A).
p16_1(A,B):-filter_uppercase(B,A).
