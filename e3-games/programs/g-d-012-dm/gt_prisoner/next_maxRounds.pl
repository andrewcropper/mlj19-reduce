% learning next_maxRounds/2
% clauses: 1
% clauses: 2
next_maxRounds(A,B):-next_maxRounds_1(A,C,B).
next_maxRounds_1(A,B,B):-my_true_maxRounds(A,B).
%time,3.0216548442840576