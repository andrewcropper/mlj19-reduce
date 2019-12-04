my_succ(1,0,5).
my_succ(1,10,15).
my_succ(1,15,20).
my_succ(1,20,25).
my_succ(1,25,30).
my_succ(1,30,35).
my_succ(1,35,40).
my_succ(1,40,45).
my_succ(1,45,50).
my_succ(1,50,55).
my_succ(1,5,10).
my_succ(1,55,60).
my_succ(1,60,65).
my_succ(1,65,70).
my_succ(1,70,75).
my_succ(1,75,80).
my_succ(1,80,85).
my_succ(1,85,90).
my_succ(1,90,95).
my_succ(1,95,100).
my_succ(2,0,5).
my_succ(2,10,15).
my_succ(2,15,20).
my_succ(2,20,25).
my_succ(2,25,30).
my_succ(2,30,35).
my_succ(2,35,40).
my_succ(2,40,45).
my_succ(2,45,50).
my_succ(2,50,55).
my_succ(2,5,10).
my_succ(2,55,60).
my_succ(2,60,65).
my_succ(2,65,70).
my_succ(2,70,75).
my_succ(2,75,80).
my_succ(2,80,85).
my_succ(2,85,90).
my_succ(2,90,95).
my_succ(2,95,100).
my_succ(3,0,5).
my_succ(3,10,15).
my_succ(3,15,20).
my_succ(3,20,25).
my_succ(3,25,30).
my_succ(3,30,35).
my_succ(3,35,40).
my_succ(3,40,45).
my_succ(3,45,50).
my_succ(3,50,55).
my_succ(3,5,10).
my_succ(3,55,60).
my_succ(3,60,65).
my_succ(3,65,70).
my_succ(3,70,75).
my_succ(3,75,80).
my_succ(3,80,85).
my_succ(3,85,90).
my_succ(3,90,95).
my_succ(3,95,100).
my_true_claim_made_by(1,white).
my_true_claim_made_by(2,black).
my_true_control(1,black).
my_true_control(2,white).
my_true_control(3,white).
my_true_gameOver(3).
my_true_score(1,black,75).
my_true_score(1,white,70).
my_true_score(2,black,65).
my_true_score(2,white,65).
my_true_score(3,black,80).
my_true_score(3,white,100).
neg(terminal(1)).
neg(terminal(2)).
not_my_succ(A,B,C) :- \+ my_succ(A,B,C).
not_my_true_claim_made_by(A,B) :- \+ my_true_claim_made_by(A,B).
not_my_true_control(A,B) :- \+ my_true_control(A,B).
not_my_true_gameOver(A) :- \+ my_true_gameOver(A).
not_my_true_score(A,B,C) :- \+ my_true_score(A,B,C).
not_opponent(A,B,C) :- \+ opponent(A,B,C).
not_role(A,B) :- \+ role(A,B).
opponent(1,black,white).
opponent(1,white,black).
opponent(2,black,white).
opponent(2,white,black).
opponent(3,black,white).
opponent(3,white,black).
pos(terminal(3)).
prim(my_succ/3).
prim(my_true_claim_made_by/2).
prim(my_true_control/2).
prim(my_true_gameOver/1).
prim(my_true_score/3).
prim(not_my_succ/3).
prim(not_my_true_claim_made_by/2).
prim(not_my_true_control/2).
prim(not_my_true_gameOver/1).
prim(not_my_true_score/3).
prim(not_opponent/3).
prim(not_role/2).
prim(opponent/3).
prim(role/2).
role(1,black).
role(1,white).
role(2,black).
role(2,white).
role(3,black).
role(3,white).
