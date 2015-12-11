custo_prato(NomePrato, Custo):-
  get_ingredientes(NomePrato, Ingredientes),
  get_custo(Ingredientes, Custo).

get_ingredientes(Sopa, Lista):-
  sopa(Sopa, Lista1),
  append([], Lista1, Lista).
get_ingredientes(Carne, Lista):-
  carne(Carne, Lista1),
  append([], Lista1, Lista).
get_ingredientes(Peixe, Lista):-
 peixe(Peixe, Lista1),
 append([], Lista1, Lista).

get_custo(Lista, Custo):-
  get_custo(Lista, 0, Custo).
get_custo([], Custo, Custo).
get_custo([H|T], C, Custo):-
  mercado(H, C1, _),
  C2 is C + C1,
  get_custo(T, C2, Custo).
