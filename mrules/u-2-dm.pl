%% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,A,B]:-[[Q,B,A]])).

%% $P(A,B) \leftarrow Q(A,B),R(A,B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A,B],[R,A,B]])).

%% $P(A,B) \leftarrow Q(A,C),R(C,B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A,C],[R,C,B]])).