delete_all_list([X|R], L1, L2):-
	delete_all(X, L1, L3),
	delete_all_list(R, L3, L2).