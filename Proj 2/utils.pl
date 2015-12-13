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


get_custo_prato(NomePrato, Custo_Prato):-
  get_ingredientes(NomePrato, Ingredientes),
  get_custo(Ingredientes, Custo),
  Custo_Prato is Custo.

get_lista_custos([], Lista_Custo, L):-
L=Lista_Custo.
get_lista_custos([H|T], Lista_Custo,L):-
  get_custo_prato(H, Custo_Prato),
  append([Custo_Prato], Lista_Custo, Lista_Custo1),
  get_lista_custos(T, Lista_Custo1,L).

getPlates([],_,[]).
getPlates([ListOfPlatesIdH | ListOfPlatesIdT], LPares, [LResH | LResT]) :-
  nth0(ListOfPlatesIdH, LPares, Elem),
  LResH = Elem,
  getPlates(ListOfPlatesIdT, LPares, LResT).

getSecond(A, B) :-
  nth0(1, A, A2),
  B = A2.

countCost([], C, R) :-
  R #= C.
countCost([LH | LT], Count, Res) :-
  getSecond(LH, UnitCost),
  Count2 #= Count + UnitCost,
  countCost(LT, Count2, Res).

calcula_pratos(LRes):-
  findall(Nome, prato_principal(_, Nome, _), Lista_Pratos),
  get_lista_custos(Lista_Pratos, L, L2),
  junta_listas(Lista_Pratos, L2, LPares),

  write('Lista de Pratos: '), write(LPares),nl,
  length(ListOfPlatesId, 5),
  length(LPares, NPlates),
  write('NumberOfPlates: '), write(NPlates), nl,
  domain(ListOfPlatesId, 1, NPlates),
  all_distinct(ListOfPlatesId),
  getPlates(ListOfPlatesId, LPares, LRes),
  countCost(LRes, 0, C),
  append([C], ListOfPlatesId, ToLabel),
  labeling([minimize(C)], ToLabel),
  write(C).

junta_listas([],[],[]).
junta_listas([L1H | L1T], [L2H | L2T], [LResH | LResT]) :-
  LResH = [L1H, L2H],
  junta_listas(L1T, L2T, LResT).

