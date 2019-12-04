% learning next_q/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
next_q(A,B):-next_q_1(A,C,B).
next_q_1(A,B,C):-does_b(A,B,D),next_q_2(A,C,D).
next_q_1(A,B,B):-my_true_q(A,B).
next_q_2(A,B,B):-my_true_p(A,B).
%time,55.06207871437073