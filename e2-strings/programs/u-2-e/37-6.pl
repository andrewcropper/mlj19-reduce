% learning p37/2
% clauses: 1
% clauses: 2
%time,1.000000
p37(A,B):-p37_1(B,A).
p37_1(A,B):-takeWhile_letter(B,A).
