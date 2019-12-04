% learning p8/2
% clauses: 1
% clauses: 2
%time,1.000000
p8(A,B):-p8_1(B,A).
p8_1(A,B):-takeWhile_letter(B,A).
