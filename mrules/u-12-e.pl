%% $P(A) \leftarrow Q(A,B),R(A,B)$\\
metarule([P, Q, R],([P, A] :- [[Q,A,B], [R,A,B]])).

%% $P(A,B) \leftarrow Q(A),R(B)$\\
metarule([P,Q,R],([P,A,B] :- [[Q,A],[R,B]])).

%% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P, Q],([P,A,B] :- [[Q,B,A]])).