% learning p31/2
% clauses: 1
% clauses: 2
%time,3.000000
p31(A,B):-p31_1(B,A).
p31_1(A,B):-filter_letter(B,A).
