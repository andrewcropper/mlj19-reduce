:- use_module('../metagol').

:-['bk'].

metagol:functional.

func_test(Atom1,PS,G):-
  Atom1 = [P,A,B],
  \+ (metagol:prove_deduce([[P,A,C]],PS,G),C \= B),
  metagol:prove_deduce([[P,A,C]],PS,G),ground(C).

prim(tail/2).
prim(dropLast/2).
prim(myreverse/2).

prim(filter_letter/2).
prim(filter_not_letter/2).
prim(filter_uppercase/2).
prim(filter_not_uppercase/2).
prim(filter_space/2).
prim(filter_not_space/2).
prim(filter_my_number/2).
prim(filter_not_my_number/2).

prim(dropWhile_letter/2).
prim(dropWhile_not_letter/2).
prim(dropWhile_uppercase/2).
prim(dropWhile_not_uppercase/2).
prim(dropWhile_space/2).
prim(dropWhile_not_space/2).
prim(dropWhile_my_number/2).
prim(dropWhile_not_my_number/2).

prim(takeWhile_letter/2).
prim(takeWhile_not_letter/2).
prim(takeWhile_uppercase/2).
prim(takeWhile_not_uppercase/2).
prim(takeWhile_space/2).
prim(takeWhile_not_space/2).
prim(takeWhile_my_number/2).
prim(takeWhile_not_my_number/2).

learn:-
    examples(Pos,Neg),
    learn(Pos,Neg,Prog),ground(Pos),!,
    pprint(Prog).

learn:-
    writeln('f(_,_):-false.').

examples(Pos2,[]):-
    findall(f(A,B),pos(A,B),Pos1),!,
    sort_examples(Pos1,Pos2).

do_test:-
    examples(Pos,_),
    forall(member(Atom,Pos),(
      Atom=..[P,A,B],
      ((call(P,A,C),B=C) -> writeln(1);writeln(0)))).

add_len(Atom,Len-Atom):-
    Atom=..[_Task,A,_],
    length(A,Len).
remove_len(_-Atom,Atom).

sort_examples(L1,L2):-
  maplist(add_len,L1,L3),
  keysort(L3,L4),
  maplist(remove_len,L4,L2).
