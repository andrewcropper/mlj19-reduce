:- ['data/trains'].

%% t1
eastbound(1,X):-
    has_car(X,C1),roof_open(C1).

%% t2
eastbound(2,X):-
    has_car(X,C1),short(C1).

%% t3
eastbound(3,X):-
    has_car(X,C1),short(C1),roof_closed(C1).

%% t4
eastbound(4,X):-
    has_car(X,C1),long(C1),roof_open(C1),three_wheels(C1).

%% t5
eastbound(5,X):-
    has_car(X,C1),long(C1),
    has_load(C1,L1),circle(L1).

%% t6
eastbound(6,X):-
    has_car(X,C1),has_load(C1,L1),two_load(L1),circle(L1).

%% t7
eastbound(7,X):-
    has_car(X,C1),long(C1),roof_open(C1),
    has_load(C1,L1),zero_load(L1).

%% t8
eastbound(8,X):-
    has_car(X,C1),long(C1),two_wheels(C1),
    has_car(X,C2),long(C2),three_wheels(C2).

split(L1,NumTrain,NumTest,Train,Test):-
    length(Train,NumTrain),
    length(Test,NumTest),
    random_permutation(L1,L2),!,
    append(Train,Rest,L2),
    append(Test,_,Rest),!.

main(NumTrials):-
    NumTrain=5,
    NumTest=100,
    between(1,8,Task),
    findall(X,(train(X),eastbound(Task,X)),Pos_),
    findall(X,(train(X),\+eastbound(Task,X)),Neg_),
    list_to_set(Pos_,Pos),
    list_to_set(Neg_,Neg),
    between(1,NumTrials,Trial),
    split(Pos,NumTrain,NumTest,PTrain,PTest),
    split(Neg,NumTrain,NumTest,NTrain,NTest),
    writeln(Task-Trial),
    write_train(Task,Trial,PTrain,NTrain),
    write_test(Task,Trial,PTest,NTest),
    false.
main.

write_train(Task,Trial,Pos,Neg):-
    atomic_list_concat(['data/train-',Task,'-',Trial,'.pl'],Fname),
    write_examples(Fname,Pos,Neg).

write_test(Task,Trial,Pos,Neg):-
    atomic_list_concat(['data/test-',Task,'-',Trial,'.pl'],Fname),
    write_examples(Fname,Pos,Neg).

write_examples(Fname,Pos,Neg):-
    open(Fname,write,Out),
    print_pos_example(Out,Pos),
    print_neg_example(Out,Neg),
    close(Out).

print_pos_example(Out,X):-
    format(Out,'pos_ex(~w).\n',[X]).

print_neg_example(Out,X):-
    format(Out,'neg_ex(~w).\n',[X]).

random_permutation(List, RandomPermutation) :-
    key_random(List, Keyed),
    keysort(Keyed, Sorted),
    pairs_values(Sorted, RandomPermutation).

key_random([], []).
key_random([H|T0], [K-H|T]) :-
    random(K),
    key_random(T0, T).
