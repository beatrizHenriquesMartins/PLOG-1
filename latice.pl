:- use_module(library(random)).
:- use_module(library(lists)).

tabuleiroInicial([
  [sun, empty, empty, empty, sun, empty, empty, empty, sun],
  [empty, sun, empty, empty, empty, empty, empty, sun, empty],
  [empty, empty, sun, empty, empty, empty, sun, empty, empty],
  [empty, empty, empty, empty, empty, empty, empty, empty, empty],
  [sun, empty, empty, empty, moon, empty, empty, empty, sun],
  [empty, empty, empty, empty, empty, empty, empty, empty, empty],
  [empty, empty, sun, empty, empty, empty, sun, empty, empty],
  [empty, sun, empty, empty, empty, empty, empty, sun, empty],
  [sun, empty, empty, empty, sun, empty, empty, empty, sun]]).

tabuleiroIntermedio([
  [sun, empty, empty, empty, sun, purple-flower, green-flower, green-bird, orange-bird],
  [empty, sun, empty, empty, empty, empty, green-lizard, green-leaf, empty],
  [empty, empty, sun, empty, red-turtle, red-leaf, green-leaf, blue-leaf, empty],
  [empty, empty, empty, empty, blue-turtle, blue-leaf, empty, empty, empty],
  [sun, empty, empty, yellow-turtle, green-turtle, empty, empty, empty, sun],
  [empty, empty, yellow-lizard, yellow-dolphin, empty, empty, empty, empty, empty],
  [empty, empty, blue-lizard, blue-dolphin, empty, empty, sun, empty, empty],
  [empty, sun, empty, empty, empty, empty, empty, sun, empty],
  [sun, empty, empty, empty, sun, empty, empty, empty, sun]]).

tiles([red-turtle, green-turtle, blue-turtle, yellow-turtle, purple-turtle, orange-turtle,
       red-leaf, green-leaf, blue-leaf, yellow-leaf, purple-leaf, orange-leaf,
       red-dolphin, green-dolphin, blue-dolphin, yellow-dolphin, purple-dolphin, orange-dolphin,
       red-lizard, green-lizard, blue-lizard, yellow-lizard, purple-lizard, orange-lizard,
       red-flower, green-flower, blue-flower, yellow-flower, purple-flower, orange-flower,
       red-bird, green-bird, blue-bird, yellow-bird, purple-bird, orange-bird, red-turtle, green-turtle, blue-turtle, yellow-turtle, purple-turtle, orange-turtle,
       red-leaf, green-leaf, blue-leaf, yellow-leaf, purple-leaf, orange-leaf,
       red-dolphin, green-dolphin, blue-dolphin, yellow-dolphin, purple-dolphin, orange-dolphin,
       red-lizard, green-lizard, blue-lizard, yellow-lizard, purple-lizard, orange-lizard,
       red-flower, green-flower, blue-flower, yellow-flower, purple-flower, orange-flower,
       red-bird, green-bird, blue-bird, yellow-bird, purple-bird, orange-bird, wind, wind, wind, wind, wind, wind, wind, wind, wind, wind]).



%% conver values v
convertValue(sun) :- write(' * ').
convertValue(empty) :- write('   ').
convertValue(moon) :- write(' O ').

convertValue(red-turtle) :- write('R +').
convertValue(green-turtle) :- write('G +').
convertValue(blue-turtle) :- write('B +').
convertValue(yellow-turtle) :- write('Y +').
convertValue(purple-turtle) :- write('P +').
convertValue(orange-turtle) :- write('O +').

convertValue(red-leaf) :- write('R $').
convertValue(green-leaf) :- write('G $').
convertValue(blue-leaf) :- write('B $').
convertValue(yellow-leaf) :- write('Y $').
convertValue(purple-leaf) :- write('P $').
convertValue(orange-leaf) :- write('O $').

convertValue(red-dolphin) :- write('R &').
convertValue(green-dolphin) :- write('G &').
convertValue(blue-dolphin) :- write('B &').
convertValue(yellow-dolphin) :- write('Y &').
convertValue(purple-dolphin) :- write('P &').
convertValue(orange-dolphin) :- write('O &').

convertValue(red-lizard) :- write('R ~').
convertValue(green-lizard) :- write('G ~').
convertValue(blue-lizard) :- write('B ~').
convertValue(yellow-lizard) :- write('Y ~').
convertValue(purple-lizard) :- write('P ~').
convertValue(orange-lizard) :- write('O ~').

convertValue(red-flower) :- write('R %').
convertValue(green-flower) :- write('G %').
convertValue(blue-flower) :- write('B %').
convertValue(yellow-flower) :- write('Y %').
convertValue(purple-flower) :- write('P %').
convertValue(green-flower) :- write('G %').
convertValue(orange-flower) :- write('O %').

convertValue(red-bird) :- write('R #').
convertValue(green-bird) :- write('G #').
convertValue(blue-bird) :- write('B #').
convertValue(yellow-bird) :- write('Y #').
convertValue(purple-bird) :- write('P #').
convertValue(orange-bird) :- write('O #').

%%convertValues ^

%%------------------------------%%
%%        DECK/HAND  STUFF      %%
%%------------------------------%%

perm_aleatoria([], []).
perm_aleatoria(L,[E|Acc]):-
        length(L, N),
        random(0, N, R),
        nth0(R, L, E),
        list_delete(L, R, L1),
        perm_aleatoria(L1, Acc).

list_delete([_|L], 0, L):-
  !.
list_delete([X|L], N, [X|Lf]):-
  N1 is N -1,
  list_delete(L, N1, Lf).


divideDeck(_, _, _, 0).
divideDeck([Deck_Head | Deck_Tail], [Deck1_Head | Deck1_Tail], Deck2, It) :-
  It > 41,
  Deck1_Head = Deck_Head,
  It1 is It - 1,
  divideDeck(Deck_Tail, Deck1_Tail, Deck2, It1).
  
divideDeck([Deck_Head | Deck_Tail], Deck1, [Deck2_Head | Deck2_Tail], It) :-
  Deck2_Head = Deck_Head,
  It1 is It - 1,
  divideDeck(Deck_Tail, Deck1, Deck2_Tail, It1).


drawHand(_, _, _, 5).
drawHand([Deck_Head | Deck_Tail], Hand, Res_Deck, It) :-
  length(Hand, N),
  N < 5,
  It is N,
  append(Hand, DeckHead, ResHand),
  It1 is It + 1,
  drawHand(DeckTail, ResHand, DeckTail, It1).

printHand([]), _.
printHand([H|T], N):-
  write(N), write '. ',
  convertValue(H),
  N1 is N+1,
  printHand(T, N1).






%%------------------------------%%
%%   -/-    DECK  STUFF  -/-    %%
%%------------------------------%%




%%------------------------------%%
%%            FUNCOES MATRIZ    %%
%%------------------------------%%

%%procurar posicao v

getMatrixElemAt(0, ElemCol, [ListAtTheHead|_], Elem):-
  getListElemAt(ElemCol, ListAtTheHead, Elem).
getMatrixElemAt(ElemRow, ElemCol, [_|RemainingLists], Elem):-
  ElemRow > 0,
  ElemRow1 is ElemRow-1,
  getMatrixElemAt(ElemRow1, ElemCol, RemainingLists, Elem).


getListElemAt(0, [ElemAtTheHead|_], ElemAtTheHead).
getListElemAt(Pos, [_|RemainingElems], Elem):-
  Pos > 0,
  Pos1 is Pos-1,
  getListElemAt(Pos1, RemainingElems, Elem).

%%procurar posicao ^

%%% 1. element row; 2. element column; 3. element to use on replacement; 3. current matrix; 4. resultant matrix.
setMatrixElemAtWith(0, ElemCol, NewElem, [RowAtTheHead|RemainingRows], [NewRowAtTheHead|RemainingRows]):-
  setListElemAtWith(ElemCol, NewElem, RowAtTheHead, NewRowAtTheHead).
setMatrixElemAtWith(ElemRow, ElemCol, NewElem, [RowAtTheHead|RemainingRows], [RowAtTheHead|ResultRemainingRows]):-
  ElemRow > 0,
  ElemRow1 is ElemRow-1,
  setMatrixElemAtWith(ElemRow1, ElemCol, NewElem, RemainingRows, ResultRemainingRows).

%%% 1. position; 2. element to use on replacement; 3. current list; 4. resultant list.
setListElemAtWith(0, Elem, [_|L], [Elem|L]).
setListElemAtWith(I, Elem, [H|L], [H|ResL]):-
  I > 0,
  I1 is I-1,
  setListElemAtWith(I1, Elem, L, ResL).

%%% 1. element to be replaced; 2. element to use on replacements; 3. current matrix; 4. resultant matrix.
replaceMatrixElemWith(_, _, [], []).
replaceMatrixElemWith(A, B, [Line|RL], [ResLine|ResRL]):-
  replaceListElemWith(A, B, Line, ResLine),
  replaceMatrixElemWith(A, B, RL, ResRL).

%%% 1. element to be replaced; 2. element to use on replacements; 3. current list; 4. resultant list.
replaceListElemWith(_, _, [], []).
replaceListElemWith(A, B, [A|L1], [B|L2]):-
  replaceListElemWith(A, B, L1, L2).
replaceListElemWith(A, B, [C|L1], [C|L2]):-
  C \= A,
  replaceListElemWith(A, B, L1, L2).



%%------------------------------%%
%%  -/-   FUNCOES MATRIZ  -/-   %%
%%------------------------------%%



clearScreen(0).
clearScreen(N):-
  nl,
  N1 is N-1,
  clearScreen(N1).



menu:-
  repeat,
  write('                          '),nl,
  write('   1. Play '),nl,
  write('   3. Quit             '),nl,
  write('enter your choice:'), nl,
  read(Choice), nl, Choice > 0, Choice =< 2,
  doit(Choice).



doit(1):-
  initgame.

doit(2):- !.

initgame:-
  tabuleiroInicial(Tab),
  tiles(Deck),
  perm_aleatoria(Deck, Deck_Res),
  divideDeck(Deck_Res, Deck1, Deck2, 82),
  drawHand(Hand1, Deck1, Res_Deck1, No1),
  drawHand(Hand2, Deck2, Res_Deck2, No2),
  pvpgamimgcicle(Tab, Res_Deck1, Res_Deck2, Hand1, Hand2, Stones1, Stones2, 0).
  

pvpgamimgcicle(INITIALBOARD, Deck1, Deck2, Hand1, Hand2, Stones1, Stones2, DiscardedWind):-
  clearScreen(50),
  write('Player 1'), nl, nl,

  drawTab(INITIALBOARD, 0), !,
  nl, nl,
  printHand(Hand1, 0),

  write('Piece to be Played:'), read(Piece), nl,
  write('Row:'), read(Row), nl,
  write('Column:'), read(Column), nl,

  selectPiece(Hand1, Piece, Piece1),
  setMatrixElemAtWith(Row, Column, Piece, INITIALBOARD, Result),
  
  drawHand(Hand1, Deck1, Res_Deck1, Nmb1),


  clearScreen(50),
  write('Player 2'), nl, nl,

  drawTab(Result, 0), !,
  nl, nl,
  write('Piece to be Played:'), read(Piece1), nl,
  write('Row:'), read(Row1), nl,
  write('Column:'), read(Column1), nl,

  setMatrixElemAtWith(Row1, Column1, Piece1, Result, Result1),

  pvpgamimgcicle(Result1).






drawTitle:-
  nl,
  write('========================================'), nl,
  write('----------------LATICE------------------'), nl,
  write('========================================'), nl,
  nl.

drawBoardHeader:-
  write('   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 '), nl,
  write('---|---|---|---|---|---|---|---|---|---|'), nl.



drawTab([H | T], Number):-
 drawBoardHeader,
 drawBoard([H | T], Number).


%%desenhar tabuleiro v
drawBoard([], _).
drawBoard([H | T], Number) :-
  write(' '), write(Number), write(' |'),
  drawList(H), nl,
  write('---|---|---|---|---|---|---|---|---|---|'), nl,
  NewNumber is Number+1,
  drawBoard(T, NewNumber).

drawList([]).
drawList([H | T]) :-
  convertValue(H), write('|'), drawList(T).

%%desenhar tabuleiro ^

latice:-
  drawTitle,
  menu.

%%desenhar tabuleiro
%%decidir jogador
%%ler inputs
%%verificar inputs
%%se ok->atualizar e imprimir tabuleiro
%%se ko->pedir nova jogada
%%terminar ciclo na condiçao de vitoria




