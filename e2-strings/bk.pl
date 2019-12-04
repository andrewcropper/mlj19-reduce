head(L,H):-
  ground(L),
  L=[H|_].

tail(L,T):-
  ground(L),
  L=[_|T].

not_uppercase(A):-
  \+uppercase(A).
not_lowercase(A):-
  \+lowercase(A).
not_letter(A):-
  \+letter(A).
not_my_number(A):-
  \+my_number(A).
not_space(A):-
  \+space(A).


%% dropWhile([A|As],B,P):-
%%   (call(P,A) ->
%%     dropWhile(As,B,P);
%%     B=[A|As]).

dropWhile(A,B,P):-
  ground(A),
  dropWhile_(A,B,P).

dropWhile_([],[],_P):-!.
dropWhile_([A|As],B,P):-
  call(P,A),!,
  dropWhile_(As,B,P).
dropWhile_(A,A,_P).

dropLast(A,B):-
  ground(A),
  dropLast_(A,B).

dropLast_([_],[]):-!.
dropLast_([H|T],[H|Out]):-
  dropLast_(T,Out).


takeWhile(A,B,P):-
  ground(A),
  takeWhile_(A,B,P).

takeWhile_([],[],_P).
takeWhile_([A|As],[A|Bs],P):-
  call(P,A),!,
  takeWhile_(As,Bs,P).
takeWhile_(_,[],_P).

map(A,B,P):-
  ground(A),
  map_(A,B,P).

map_([],[],_F).
map_([A|As],[B|Bs],F):-
  call(F,A,B),!,
  map_(As,Bs,F).

filter_letter(A,B):-
  filter(A,B,letter).
filter_not_letter(A,B):-
  filter(A,B,not_letter).
filter_uppercase(A,B):-
  filter(A,B,uppercase).
filter_not_uppercase(A,B):-
  filter(A,B,not_uppercase).
filter_space(A,B):-
  filter(A,B,space).
filter_not_space(A,B):-
  filter(A,B,not_space).
filter_my_number(A,B):-
  filter(A,B,my_number).
filter_not_my_number(A,B):-
  filter(A,B,not_my_number).

takeWhile_letter(A,B):-
  takeWhile(A,B,letter).
takeWhile_not_letter(A,B):-
  takeWhile(A,B,not_letter).
takeWhile_uppercase(A,B):-
  takeWhile(A,B,uppercase).
takeWhile_not_uppercase(A,B):-
  takeWhile(A,B,not_uppercase).
takeWhile_space(A,B):-
  takeWhile(A,B,space).
takeWhile_not_space(A,B):-
  takeWhile(A,B,not_space).
takeWhile_my_number(A,B):-
  takeWhile(A,B,my_number).
takeWhile_not_my_number(A,B):-
  takeWhile(A,B,not_my_number).

dropWhile_letter(A,B):-
  dropWhile(A,B,letter).
dropWhile_not_letter(A,B):-
  dropWhile(A,B,not_letter).
dropWhile_uppercase(A,B):-
  dropWhile(A,B,uppercase).
dropWhile_not_uppercase(A,B):-
  dropWhile(A,B,not_uppercase).
dropWhile_space(A,B):-
  dropWhile(A,B,space).
dropWhile_not_space(A,B):-
  dropWhile(A,B,not_space).
dropWhile_my_number(A,B):-
  dropWhile(A,B,my_number).
dropWhile_not_my_number(A,B):-
  dropWhile(A,B,not_my_number).

filter(A,B,P):-
  ground(A),
  filter_(A,B,P).

filter_([],[],_F).
filter_([A|As],[A|Out],F):-
  call(F,A),!,
  filter_(As,Out,F).
filter_([_|As],Out,F):-
  filter_(As,Out,F).

myreverse(A,B):-
  ground(A),
  (ground(B) -> A\=B; true),
  reverse(A,B),
  A\=B.

uppercase('A').
uppercase('B').
uppercase('C').
uppercase('D').
uppercase('E').
uppercase('F').
uppercase('G').
uppercase('H').
uppercase('I').
uppercase('J').
uppercase('K').
uppercase('L').
uppercase('M').
uppercase('N').
uppercase('O').
uppercase('P').
uppercase('Q').
uppercase('R').
uppercase('S').
uppercase('T').
uppercase('U').
uppercase('V').
uppercase('W').
uppercase('X').
uppercase('Y').
uppercase('Z').

lowercase('a').
lowercase('b').
lowercase('c').
lowercase('d').
lowercase('e').
lowercase('f').
lowercase('g').
lowercase('h').
lowercase('i').
lowercase('j').
lowercase('k').
lowercase('l').
lowercase('m').
lowercase('n').
lowercase('o').
lowercase('p').
lowercase('q').
lowercase('r').
lowercase('s').
lowercase('t').
lowercase('u').
lowercase('v').
lowercase('w').
lowercase('x').
lowercase('y').
lowercase('z').

letter('A').
letter('B').
letter('C').
letter('D').
letter('E').
letter('F').
letter('G').
letter('H').
letter('I').
letter('J').
letter('K').
letter('L').
letter('M').
letter('N').
letter('O').
letter('P').
letter('Q').
letter('R').
letter('S').
letter('T').
letter('U').
letter('V').
letter('W').
letter('X').
letter('Y').
letter('Z').
letter('a').
letter('b').
letter('c').
letter('d').
letter('e').
letter('f').
letter('g').
letter('h').
letter('i').
letter('j').
letter('k').
letter('l').
letter('m').
letter('n').
letter('o').
letter('p').
letter('q').
letter('r').
letter('s').
letter('t').
letter('u').
letter('v').
letter('w').
letter('x').
letter('y').
letter('z').

my_number('0').
my_number('1').
my_number('2').
my_number('3').
my_number('4').
my_number('5').
my_number('6').
my_number('7').
my_number('8').
my_number('9').

space(' ').