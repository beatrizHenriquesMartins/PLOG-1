:-use_module(library(clpfd)).

carteiro(N,L,C):-
length(L,N),
domain(L, 1, N),
soma_dif(L,C),
circuit(L), % cirtuito tipo nodes - CAL
labeling([maximize(C)],L).

soma_dif([X,Y|R],SD):-
	SD #= abs(X-Y) + SDR,
	soma_dif([Y|R],SDR).
soma_dif([_],0).