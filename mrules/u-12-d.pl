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

%% $P(A,B) \leftarrow Q(A,C),R(A,D),S(B,C),T(B,D),U(C,D)$\\
metarule([P,Q,R,S,T,U],([P,A,B]:-[[Q,A,C],[R,A,D],[S,B,C],[T,B,D],[U,C,D]])).

%% $P(A,B) \leftarrow Q(B,C),R(A,D),S(B,D),T(C,E),U(E)$\\
metarule([P,Q,R,S,T,U],([P,A,B]:-[[Q,B,C],[R,A,D],[S,B,D],[T,C,E],[U,E]])).

%% $P(A,B) \leftarrow Q(B,C),R(A,D),S(B,D),T(C,E),U(C,E)$\\
metarule([P,Q,R,S,T,U],([P,A,B]:-[[Q,B,C],[R,A,D],[S,B,D],[T,C,E],[U,C,E]])).