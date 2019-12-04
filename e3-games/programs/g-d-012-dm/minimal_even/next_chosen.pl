% learning next_chosen/2
% clauses: 1
% clauses: 2
% clauses: 3
next_chosen(A,B):-next_chosen_1(A,C,B).
next_chosen(A,B):-does_choose(A,C,B).
next_chosen_1(A,B,B):-my_true_chosen(A,B).
%time,0.11401939392089844