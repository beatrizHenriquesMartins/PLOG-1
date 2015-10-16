delete(X, L1, L2):-
	append(L3, [X|T], L1),
	append(L3, T, L2).
	