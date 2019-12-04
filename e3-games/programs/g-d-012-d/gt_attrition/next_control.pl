% learning next_control/2
% clauses: 1
% clauses: 2
next_control(A,B):-next_control_1(A,C,B).
next_control_1(A,B,B):-not_my_true_control(A,B).
%time,0.06412982940673828