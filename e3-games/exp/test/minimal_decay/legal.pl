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
my_true_value(1,5).
my_true_value(2,2).
not_my_succ(A,B,C) :- \+ my_succ(A,B,C).
not_my_true_value(A,B) :- \+ my_true_value(A,B).
pos(legal(1,player,noop)).
pos(legal(1,player,pressButton)).
pos(legal(2,player,noop)).
pos(legal(2,player,pressButton)).
prim(my_succ/3).
prim(my_true_value/2).
prim(not_my_succ/3).
prim(not_my_true_value/2).
