ordenada([]).
ordenada([_]).
ordenada([X, Y|R]):-
	X<=Y,
	ordenada([Y|R]).