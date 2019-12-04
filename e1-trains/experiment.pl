:- use_module('../metagol').

:-['data/trains'].

prim(has_car/2).
prim(has_load/2).
prim(short/1).
prim(long/1).
prim(two_wheels/1).
prim(three_wheels/1).
prim(roof_open/1).
prim(roof_closed/1).
prim(zero_load/1).
prim(one_load/1).
prim(two_load/1).
prim(circle/1).
prim(triangle/1).
prim(rectangle/1).

learn:-
    findall(f(X),(pos_ex(Xs),member(X,Xs)),Pos),
    findall(f(X),(neg_ex(Xs),member(X,Xs)),Neg),
    learn(Pos,Neg),!,
    halt.
learn:-
    writeln('f(_):-false.'),
    halt.

do_test:-
    current_predicate(f/1),!,
    forall((pos_ex(Xs),member(X,Xs)),do_test_pos(f(X))),
    forall((neg_ex(Xs),member(X,Xs)),do_test_neg(f(X))).

do_test:-
    forall((pos_ex(Xs),member(X,Xs)),writeln(0)),
    forall((neg_ex(Xs),member(X,Xs)),writeln(0)).

do_test_pos(Goal):-
  (call(Goal) -> writeln(1); writeln(0)).

do_test_neg(Goal):-
  (call(Goal) -> writeln(0); writeln(1)).