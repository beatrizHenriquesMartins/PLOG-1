factorial(0, 1).
factorial(N, Valor):-
	N1 is N-1,
	factorial(N1, Valor1),
	Valor is N*Valor1.
