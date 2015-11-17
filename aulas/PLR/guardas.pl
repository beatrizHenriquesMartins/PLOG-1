:-use_module(library(clpfd)).


%correr 'guardas(L), write(L), nl, fail'. A lista resultante representa o número da sala (valores da lista), em que o guarda (posição na lista) está.
guardas(L):-

	length(L, 12),
	domain(L, 1, 12),
	count(1, L, #=, S1), %Nº de guardas na Sala 1
	count(2, L, #=, S2), %Nº de guardas na Sala 2
	count(3, L, #=, S3), %Nº de guardas na Sala 3
	count(4, L, #=, S4), %Nº de guardas na Sala 4
	count(5, L, #=, S5), %Nº de guardas na Sala 5
	count(6, L, #=, S6), %Nº de guardas na Sala 6
	count(7, L, #=, S7), %Nº de guardas na Sala 7
	count(8, L, #=, S8), %Nº de guardas na Sala 8
	count(9, L, #=, S9), %Nº de guardas na Sala 9
	count(10, L, #=, S10), %Nº de guardas na Sala 10
	count(11, L, #=, S11), %Nº de guardas na Sala 11
	count(12, L, #=, S12), %Nº de guardas na Sala 12

	sum([S1, S2, S3, S4], #=, 5), %N
	sum([S1, S12, S11, S10], #=, 5), %W
	sum([S7, S6, S5, S4], #=, 5), %S
	sum([S7, S8, S9, S10], #=, 5), %E

	labeling([], L).