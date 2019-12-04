% $P \leftarrow Q$\\
metarule([P,Q],([P,Task]:-[[Q,Task]])).

% $P \leftarrow Q,R$\\
metarule([P,Q,R],([P,Task]:-[[Q,Task,R]])).

% $P(A) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,Task,A]:-[[Q,Task,_B,A]])).

% $P(A,A) \leftarrow Q(A)$\\
metarule([P,Q],([P,Task,A,A]:-[[Q,Task,A]])).

% $P(A,A) \leftarrow Q(A,A)$\\
metarule([P,Q],([P,Task,A,A]:-[[Q,Task,A,A]])).

% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,Task,A,B]:-[[Q,Task,B,A]])).

% $P(A,B) \leftarrow Q,R(A,B)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q],[R,Task,A,B]])).

% $P(A,B) \leftarrow Q(A,B),R(A,B)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,A,B],[R,Task,A,B]])).

% $P(A,B) \leftarrow Q(A,C),R(B,C)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,A,C],[R,Task,B,C]])).

% $P(A,B) \leftarrow Q(B,C),R(A,D)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,B,_C],[R,Task,A,_D]])).

% $P(A,B) \leftarrow Q(B,C),R(A,D),S(B,D),T(C,E)$\\
metarule([P,Q,R,S,T],([P,Task,A,B]:-[[Q,Task,B,C],[R,Task,A,D],[S,Task,B,D],[T,Task,C,_E]])).

% $P(A,B) \leftarrow Q(A,C),R(A,D),S(B,C),T(B,D),U(C,D)$\\
metarule([P,Q,R,S,T,U],([P,Task,A,B]:-[[Q,Task,A,C],[R,Task,A,D],[S,Task,B,C],[T,Task,B,D],[U,Task,C,D]])).

% $P(A,B) \leftarrow Q(B,C),R(A,D),S(C,E),T(B,F),U(D,F)$\\
metarule([P,Q,R,S,T,U],([P,Task,A,B]:-[[Q,Task,B,C],[R,Task,A,D],[S,Task,C,_E],[T,Task,B,F],[U,Task,D,F]])).

% $P(A,B) \leftarrow Q(B,C),R(B,D),S(C,E),T(A,F),U(D,F)$\\
metarule([P,Q,R,S,T,U],([P,Task,A,B]:-[[Q,Task,B,C],[R,Task,B,D],[S,Task,C,_E],[T,Task,A,F],[U,Task,D,F]])).