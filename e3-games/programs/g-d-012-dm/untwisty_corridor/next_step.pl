% learning next_step/2
% clauses: 1
% clauses: 2
% clauses: 3
% clauses: 4
next_step(A,B):-next_step_1(A,C,B).
next_step_1(A,B,C):-my_successor(A,B,C),next_step_2(A,B,C).
next_step_2(A,B,C):-next_step_3(A,B,D),not_does(A,C,D).
next_step_3(A,B,B):-my_true_step(A,B).
%time,9.75143551826477