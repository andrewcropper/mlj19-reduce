% learning next_maxRounds/2
% clauses: 1
% clauses: 2
next_maxRounds(A,B):-next_maxRounds_1(A,B,C).
next_maxRounds_1(A,B,C):-my_true_maxRounds(A,B),my_true_blackScore(A,C).
%time,3.07429838180542