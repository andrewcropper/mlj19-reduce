does(1,player,pressButton).
does(2,player,noop).
does(3,player,pressButton).
does(4,player,pressButton).
does(5,player,pressButton).
does(6,player,noop).
does(7,player,noop).
does(8,player,pressButton).
does(9,player,pressButton).
my_succ(1,0,1).
my_succ(1,1,2).
my_succ(1,2,3).
my_succ(1,3,4).
my_succ(1,4,5).
my_succ(2,0,1).
my_succ(2,1,2).
my_succ(2,2,3).
my_succ(2,3,4).
my_succ(2,4,5).
my_succ(3,0,1).
my_succ(3,1,2).
my_succ(3,2,3).
my_succ(3,3,4).
my_succ(3,4,5).
my_succ(4,0,1).
my_succ(4,1,2).
my_succ(4,2,3).
my_succ(4,3,4).
my_succ(4,4,5).
my_succ(5,0,1).
my_succ(5,1,2).
my_succ(5,2,3).
my_succ(5,3,4).
my_succ(5,4,5).
my_succ(6,0,1).
my_succ(6,1,2).
my_succ(6,2,3).
my_succ(6,3,4).
my_succ(6,4,5).
my_succ(7,0,1).
my_succ(7,1,2).
my_succ(7,2,3).
my_succ(7,3,4).
my_succ(7,4,5).
my_succ(8,0,1).
my_succ(8,1,2).
my_succ(8,2,3).
my_succ(8,3,4).
my_succ(8,4,5).
my_succ(9,0,1).
my_succ(9,1,2).
my_succ(9,2,3).
my_succ(9,3,4).
my_succ(9,4,5).
my_true_value(1,0).
my_true_value(2,3).
my_true_value(3,3).
my_true_value(4,4).
my_true_value(5,5).
my_true_value(6,2).
my_true_value(8,2).
neg(next_value(1,0)).
neg(next_value(1,1)).
neg(next_value(1,2)).
neg(next_value(1,3)).
neg(next_value(1,4)).
neg(next_value(2,0)).
neg(next_value(2,1)).
neg(next_value(2,3)).
neg(next_value(2,4)).
neg(next_value(2,5)).
neg(next_value(3,0)).
neg(next_value(3,1)).
neg(next_value(3,2)).
neg(next_value(3,3)).
neg(next_value(3,4)).
neg(next_value(4,0)).
neg(next_value(4,1)).
neg(next_value(4,2)).
neg(next_value(4,3)).
neg(next_value(4,4)).
neg(next_value(5,0)).
neg(next_value(5,1)).
neg(next_value(5,2)).
neg(next_value(5,3)).
neg(next_value(5,4)).
neg(next_value(6,0)).
neg(next_value(6,2)).
neg(next_value(6,3)).
neg(next_value(6,4)).
neg(next_value(6,5)).
neg(next_value(7,0)).
neg(next_value(7,1)).
neg(next_value(7,2)).
neg(next_value(7,3)).
neg(next_value(7,4)).
neg(next_value(7,5)).
neg(next_value(8,0)).
neg(next_value(8,1)).
neg(next_value(8,2)).
neg(next_value(8,3)).
neg(next_value(8,4)).
neg(next_value(9,0)).
neg(next_value(9,1)).
neg(next_value(9,2)).
neg(next_value(9,3)).
neg(next_value(9,4)).
not_does(A,B,C) :- \+ does(A,B,C).
not_my_succ(A,B,C) :- \+ my_succ(A,B,C).
not_my_true_value(A,B) :- \+ my_true_value(A,B).
pos(next_value(1,5)).
pos(next_value(2,2)).
pos(next_value(3,5)).
pos(next_value(4,5)).
pos(next_value(5,5)).
pos(next_value(6,1)).
pos(next_value(8,5)).
pos(next_value(9,5)).
prim(does/3).
prim(my_succ/3).
prim(my_true_value/2).
prim(not_does/3).
prim(not_my_succ/3).
prim(not_my_true_value/2).