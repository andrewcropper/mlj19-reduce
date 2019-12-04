%% $P(A) \leftarrow Q(A)$\\
metarule([P,Q],([P,A]:-[[Q,A]])).

%% $P(A) \leftarrow Q(A),R(A)$\\
metarule([P,Q,R],([P,A]:-[[Q,A],[R,A]])).

%% $P(A) \leftarrow Q(A),R(A)$\\
metarule([P,Q,R],([P,A]:-[[Q,A],[R,A]])).

%% $P(A) \leftarrow Q(A,B),R(B)$\\
metarule([P,Q,R],([P,A]:-[[Q,A,B],[R,B]])).

%% $P(A) \leftarrow Q(A,B),R(A,B)$\\
metarule([P,Q,R],([P,A]:-[[Q,A,B],[R,A,B]])).

%% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,A,B]:-[[Q,B,A]])).

%% $P(A,B) \leftarrow Q(A),R(B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A],[R,B]])).

%% $P(A,B) \leftarrow Q(A),R(A,B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A],[R,A,B]])).

%% $P(A,B) \leftarrow Q(A,B),R(A,B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A,B],[R,A,B]])).

%% $P(A,B) \leftarrow Q(A,C),R(C,B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A,C],[R,C,B]])).