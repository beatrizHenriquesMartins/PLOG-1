delete_all(X, L1, L2):-
	delete(X, L1, L3),
	delete_all(X, L3, L2),
	
delete_all(X, L, L):-
	\+ member(X, L).