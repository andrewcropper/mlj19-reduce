% learning next_chosen/2
% clauses: 1
% clauses: 2
next_chosen(A,B):-my_true_chosen(A,B).
next_chosen(A,B):-does_choose(A,C,B).
%time,0.16445446014404297