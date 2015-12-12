get_ingredientes(Sopa, Lista):-
  sopa(Sopa, Lista1),
  append([], Lista1, Lista).

get_ingredientes(Nome, Lista):-
  prato_principal(_, Nome, Lista1),
  append([], Lista1, Lista).

get_custo([], 0).
get_custo([H|T], Custo):-
  mercado(H, C1, _),
  get_custo(T, Custo1),
  Custo is C1 + Custo1.


get_custo_prato(NomePrato):-
  get_ingredientes(NomePrato, Ingredientes),
  get_custo(Ingredientes, Custo).




