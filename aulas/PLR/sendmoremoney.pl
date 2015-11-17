:-use_module(library(clpfd)).


cripta([S, E, N, D, M, O, R, Y]):-
	domain([S, E, N, D, M, O, R, Y], 0, 9),
	S #> 0, M #> 0,
	all_different([S, E, N, D, M, O, R, Y]),
	(S*1000+E*100+N*10+D) + (M*1000+O*100+R*10+E) #= M*10000+O*1000+N*100+E*10+Y,
	labeling([], [S, E, N, D, M, O, R, Y]).