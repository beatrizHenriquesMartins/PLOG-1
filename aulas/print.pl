imprime([H|T]):-
	mostra(H), nl, 
	imprime(T).
imprime([]).

mostra([H|T]):- 
	write('|'), write(H),
	mostra(T).
	
mostra([]):- write('|').