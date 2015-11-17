:-use_module(library(clpfd)).

%correr 'guardas(L), write(L), nl, fail'. A lista resultante representa o número de guardas (valores na lista) na sala (posição na lista).
guardas(L):-
	length(L, 12),
	domain(L, 0, 5),
	sum(L, #=, 12),
	L=[S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12],
	sum([S1, S2, S3, S4], #=, 5), %N
	sum([S1, S12, S11, S10], #=, 5), %W
	sum([S7, S6, S5, S4], #=, 5), %S	
	sum([S7, S8, S9, S10], #=, 5), %E
	labeling([], L).