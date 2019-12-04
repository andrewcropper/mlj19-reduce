% learning next_chosen/2
% clauses: 1
% clauses: 2
% clauses: 3
next_chosen(A,B):-next_chosen_1(A,B,C).
next_chosen_1(A,B,C):-my_true_chosen(A,B),even(A,C).
next_chosen_1(A,B,C):-does_choose(A,C,B).
%time,0.16419339179992676