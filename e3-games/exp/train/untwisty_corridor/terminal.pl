my_input(1,robot,a).
my_input(1,robot,b).
my_input(1,robot,c).
my_input(1,robot,d).
my_input(1,robot,e).
my_input(1,robot,f).
my_input(1,robot,g).
my_input(1,robot,h).
my_input(2,robot,a).
my_input(2,robot,b).
my_input(2,robot,c).
my_input(2,robot,d).
my_input(2,robot,e).
my_input(2,robot,f).
my_input(2,robot,g).
my_input(2,robot,h).
my_input(3,robot,a).
my_input(3,robot,b).
my_input(3,robot,c).
my_input(3,robot,d).
my_input(3,robot,e).
my_input(3,robot,f).
my_input(3,robot,g).
my_input(3,robot,h).
my_input(4,robot,a).
my_input(4,robot,b).
my_input(4,robot,c).
my_input(4,robot,d).
my_input(4,robot,e).
my_input(4,robot,f).
my_input(4,robot,g).
my_input(4,robot,h).
my_input(5,robot,a).
my_input(5,robot,b).
my_input(5,robot,c).
my_input(5,robot,d).
my_input(5,robot,e).
my_input(5,robot,f).
my_input(5,robot,g).
my_input(5,robot,h).
my_input(6,robot,a).
my_input(6,robot,b).
my_input(6,robot,c).
my_input(6,robot,d).
my_input(6,robot,e).
my_input(6,robot,f).
my_input(6,robot,g).
my_input(6,robot,h).
my_input(7,robot,a).
my_input(7,robot,b).
my_input(7,robot,c).
my_input(7,robot,d).
my_input(7,robot,e).
my_input(7,robot,f).
my_input(7,robot,g).
my_input(7,robot,h).
my_successor(1,1,2).
my_successor(1,2,3).
my_successor(1,3,4).
my_successor(1,4,5).
my_successor(1,5,6).
my_successor(1,6,7).
my_successor(1,7,8).
my_successor(2,1,2).
my_successor(2,2,3).
my_successor(2,3,4).
my_successor(2,4,5).
my_successor(2,5,6).
my_successor(2,6,7).
my_successor(2,7,8).
my_successor(3,1,2).
my_successor(3,2,3).
my_successor(3,3,4).
my_successor(3,4,5).
my_successor(3,5,6).
my_successor(3,6,7).
my_successor(3,7,8).
my_successor(4,1,2).
my_successor(4,2,3).
my_successor(4,3,4).
my_successor(4,4,5).
my_successor(4,5,6).
my_successor(4,6,7).
my_successor(4,7,8).
my_successor(5,1,2).
my_successor(5,2,3).
my_successor(5,3,4).
my_successor(5,4,5).
my_successor(5,5,6).
my_successor(5,6,7).
my_successor(5,7,8).
my_successor(6,1,2).
my_successor(6,2,3).
my_successor(6,3,4).
my_successor(6,4,5).
my_successor(6,5,6).
my_successor(6,6,7).
my_successor(6,7,8).
my_successor(7,1,2).
my_successor(7,2,3).
my_successor(7,3,4).
my_successor(7,4,5).
my_successor(7,5,6).
my_successor(7,6,7).
my_successor(7,7,8).
my_true(1,p).
my_true(1,q1).
my_true(2,p).
my_true(2,q1).
my_true(3,q1).
my_true(4,p).
my_true(4,q1).
my_true(5,q1).
my_true(5,q2).
my_true(5,q3).
my_true(6,q1).
my_true(6,q2).
my_true(6,q3).
my_true(6,q4).
my_true(7,p).
my_true(7,q1).
my_true_step(1,4).
my_true_step(2,2).
my_true_step(3,1).
my_true_step(4,5).
my_true_step(5,3).
my_true_step(6,4).
my_true_step(7,6).
neg(terminal(1)).
neg(terminal(2)).
neg(terminal(3)).
neg(terminal(4)).
neg(terminal(5)).
neg(terminal(6)).
neg(terminal(7)).
not_my_input(A,B,C) :- \+ my_input(A,B,C).
not_my_successor(A,B,C) :- \+ my_successor(A,B,C).
not_my_true(A,B) :- \+ my_true(A,B).
not_my_true_step(A,B) :- \+ my_true_step(A,B).
not_role(A,B) :- \+ role(A,B).
prim(my_input/3).
prim(my_successor/3).
prim(my_true/2).
prim(my_true_step/2).
prim(not_my_input/3).
prim(not_my_successor/3).
prim(not_my_true/2).
prim(not_my_true_step/2).
prim(not_role/2).
prim(role/2).
role(1,robot).
role(2,robot).
role(3,robot).
role(4,robot).
role(5,robot).
role(6,robot).
role(7,robot).