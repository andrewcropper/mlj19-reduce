%% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,A,B] :- [[Q,B,A]])).

%% $P(A,B) \leftarrow Q(B,C),R(A,D),S(A,D),T(B,C)$\\
metarule([P,Q,R,S,T],([P,A,B] :- [[Q,B,C],[R,A,D],[S,A,D],[T,B,C]])).