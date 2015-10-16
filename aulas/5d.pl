nesimo(1, [X|_], X).
nesimo(N, [_|R], X):-
	N>1,
	N1 is N-1,
	nesimo(N1, R, X).
	
