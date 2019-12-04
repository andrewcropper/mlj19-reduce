% learning next_control/2
% clauses: 1
% clauses: 2
next_control(A,B):-next_control_1(A,B,C).
next_control_1(A,B,C):-not_my_true_control(A,B),my_true_control(A,C).
%time,0.06456995010375977