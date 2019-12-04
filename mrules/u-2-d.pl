%% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,A,B]:-[[Q,B,A]])).

%% $P(A,B) \leftarrow Q(A,B),R(A,B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A,B],[R,A,B]])).

%% $P(A,B) \leftarrow Q(A,C),R(C,B)$\\
metarule([P,Q,R],([P,A,B]:-[[Q,A,C],[R,C,B]])).

%% $P(A,B) \leftarrow Q(A,B),R(A,C),S(A,C)$\\
metarule([P,Q,R,S],([P,A,B]:-[[Q,A,B],[R,A,C],[S,A,C]])).

%% $P(A,B) \leftarrow Q(A,B),R(A,C),S(C,D),T(C,D)$\\
metarule([P,Q,R,S,T],([P,A,B]:-[[Q,A,B],[R,A,C],[S,C,D],[T,C,D]])).

%% $P(A,B) \leftarrow Q(B,C),R(A,D),S(A,D),T(B,C)$\\
metarule([P,Q,R,S,T],([P,A,B]:-[[Q,B,C],[R,A,D],[S,A,D],[T,B,C]])).

%% $P(A,B) \leftarrow Q(B,C),R(A,D),S(B,C),T(B,D)$\\
metarule([P,Q,R,S,T],([P,A,B]:-[[Q,B,C],[R,A,D],[S,B,C],[T,B,D]])).

%% $P(A,B) \leftarrow Q(A,C),R(A,D),S(B,C),T(B,D),U(C,D)$\\
metarule([P,Q,R,S,T,U],([P,A,B]:-[[Q,A,C],[R,A,D],[S,B,C],[T,B,D],[U,C,D]])).

%% $P(A,B) \leftarrow Q(B,C),R(A,D),S(B,D),T(C,E),U(C,E)$\\
metarule([P,Q,R,S,T,U],([P,A,B]:-[[Q,B,C],[R,A,D],[S,B,D],[T,C,E],[U,C,E]])).

%% $P(A,B) \leftarrow Q(B,C),R(C,D),S(A,E),T(B,E),U(C,D)$\\
metarule([P,Q,R,S,T,U],([P,A,B]:-[[Q,B,C],[R,C,D],[S,A,E],[T,B,E],[U,C,D]])).