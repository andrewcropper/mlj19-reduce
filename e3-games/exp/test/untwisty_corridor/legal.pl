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
my_true(1,p).
my_true(1,q1).
my_true(2,p).
my_true(2,q1).
my_true(3,p).
my_true(3,q1).
my_true_step(1,4).
my_true_step(2,2).
my_true_step(3,7).
not_my_input(A,B,C) :- \+ my_input(A,B,C).
not_my_successor(A,B,C) :- \+ my_successor(A,B,C).
not_my_true(A,B) :- \+ my_true(A,B).
not_my_true_step(A,B) :- \+ my_true_step(A,B).
not_role(A,B) :- \+ role(A,B).
pos(legal(1,robot,a)).
pos(legal(1,robot,b)).
pos(legal(1,robot,c)).
pos(legal(1,robot,d)).
pos(legal(1,robot,e)).
pos(legal(1,robot,f)).
pos(legal(1,robot,g)).
pos(legal(1,robot,h)).
pos(legal(2,robot,a)).
pos(legal(2,robot,b)).
pos(legal(2,robot,c)).
pos(legal(2,robot,d)).
pos(legal(2,robot,e)).
pos(legal(2,robot,f)).
pos(legal(2,robot,g)).
pos(legal(2,robot,h)).
pos(legal(3,robot,a)).
pos(legal(3,robot,b)).
pos(legal(3,robot,c)).
pos(legal(3,robot,d)).
pos(legal(3,robot,e)).
pos(legal(3,robot,f)).
pos(legal(3,robot,g)).
pos(legal(3,robot,h)).
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
