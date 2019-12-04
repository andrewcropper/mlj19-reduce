% e
% $P \leftarrow Q$\\
metarule([P,Q],([P,Task]:-[[Q,Task]])).

% $P(A) \leftarrow Q(A,B)$\\
metarule([P,Q],([P,Task,A]:-[[Q,Task,A,_B]])).

% $P(A,B) \leftarrow Q(B,A)$\\
metarule([P,Q],([P,Task,A,B]:-[[Q,Task,B,A]])).

% $P(A,B) \leftarrow Q(A),R(B)$\\
metarule([P,Q,R],([P,Task,A,B]:-[[Q,Task,A],[R,Task,B]])).