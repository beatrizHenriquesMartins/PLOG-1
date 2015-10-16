delete_all(X, [X|R], L):-
	delete_all(X, R, L).
delete_all(X, [Y|R], [Y|R1]):-
		X \= Y,
		delete_all(X, R, R2).
	
delete_all(_, [], []).