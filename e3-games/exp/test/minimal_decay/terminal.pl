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
my_true_value(1,4).
neg(terminal(1)).
neg(terminal(2)).
not_my_succ(A,B,C) :- \+ my_succ(A,B,C).
not_my_true_value(A,B) :- \+ my_true_value(A,B).
prim(my_succ/3).
prim(my_true_value/2).
prim(not_my_succ/3).
prim(not_my_true_value/2).
