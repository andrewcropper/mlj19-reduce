% learning p12/2
% clauses: 1
% clauses: 2
% clauses: 3
%time,15.000000
p12(A,B):-p12_1(A,C),takeWhile_letter(C,B).
p12_1(A,B):-p12_2(A,C),p12_2(C,B).
p12_2(A,B):-dropWhile_letter(A,C),tail(C,B).
