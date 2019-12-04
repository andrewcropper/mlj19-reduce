%% $P(A) \leftarrow Q(A)$\\
metarule([P, Q],([P, A] :- [[Q, A]])).

%% $P(A) \leftarrow Q(A,B),R(A,B)$\\
metarule([P, Q, R],([P, A] :- [[Q,A,B], [R,A,B]])).

%% $P(A,B) \leftarrow Q(A,B)$\\
metarule([P, Q],([P,A,B] :- [[Q,A,B]])).

%% %% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P, Q],([P,A,B] :- [[Q,B,A]])).

%% $P(A,B) \leftarrow Q(A),R(B)$\\
metarule([P,Q,R],([P,A,B] :- [[Q,A],[R,B]])).

%% %% $P(A,B) \leftarrow Q(B),R(A,C),S(A,C)$\\
metarule([P,Q,R,S],([P,A,B] :- [[Q,B],[R,A,C],[S,A,C]])).

%% $P(A,B) \leftarrow Q(A),R(B,C),S(B,C)$\\
metarule([P,Q,R,S],([P,A,B] :- [[Q,A],[R,B,C],[S,B,C]])).

%% %% $P(A,B) \leftarrow Q(B,C),R(A,D),S(A,D),T(B,C)$\\
metarule([P,Q,R,S,T],([P,A,B] :- [[Q,B,C],[R,A,D],[S,A,D],[T,B,C]])).