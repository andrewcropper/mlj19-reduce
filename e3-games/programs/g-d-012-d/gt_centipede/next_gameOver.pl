% learning next_gameOver/1
% clauses: 1
% clauses: 2
next_gameOver(A):-next_gameOver_1(A,finish).
next_gameOver_1(A,B):-does(A,C,B).
%time,0.2159862518310547