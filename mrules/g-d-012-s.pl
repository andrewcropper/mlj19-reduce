% $P \leftarrow Q$\\
metarule([P,Q],([P,Task]:-[[Q,Task]])).

% $P(A) \leftarrow Q(A)$\\
metarule([P,Q],([P,Task,A]:-[[Q,Task,A]])).

% $P(A) \leftarrow Q(A,B)$\\
metarule([P,Q],([P,Task,A]:-[[Q,Task,A,_B]])).

% $P(A) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,Task,A]:-[[Q,Task,_B,A]])).

% $P(A,A) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,Task,A,A]:-[[Q,Task,_B,A]])).

% $P(A,B) \leftarrow Q(A,B)$\\
metarule([P,Q],([P,Task,A,B]:-[[Q,Task,A,B]])).

% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,Task,A,B]:-[[Q,Task,B,A]])).

% $P(A,B) \leftarrow Q(A),R(B)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,A],[R,Task,B]])).

% $P(A,B) \leftarrow Q(A),R(B,C)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,A],[R,Task,B,_C]])).

% $P(A,B) \leftarrow Q(B),R(A,C)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,B],[R,Task,A,_C]])).

% $P(A,B) \leftarrow Q(B,C),R(A,D)$
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,B,_C],[R,Task,A,_D]])).