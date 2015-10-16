enesimo2(N, L, X):-
	N1 is N-1,
	length(L1, N1),
	append(L1, [X|_], L).