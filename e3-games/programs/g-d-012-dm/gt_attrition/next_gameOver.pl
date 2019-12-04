% learning next_gameOver/1
% clauses: 1
% clauses: 2
next_gameOver(A):-next_gameOver_1(A,end_game).
next_gameOver_1(A,B):-does(A,C,B).
%time,0.06390142440795898