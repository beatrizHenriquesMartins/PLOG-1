%% tabuleiroInicial([
%% 	[sun, empty, empty, empty, sun, empty, empty, empty, sun],
%%   [empty, sun, empty, empty, empty, empty, empty, sun, empty],
%%   [empty, empty, sun, empty, empty, empty, sun, empty, empty],
%%   [empty, empty, empty, empty, empty, empty, empty, empty, empty],
%%   [sun, empty, empty, empty, moon, empty, empty, empty, sun],
%%   [empty, empty, empty, empty, empty, empty, empty, empty, empty],
%%   [empty, empty, sun, empty, empty, empty, sun, empty, empty],
%%   [empty, sun, empty, empty, empty, empty, empty, sun, empty],
%%   [sun, empty, empty, empty, sun, empty, empty, empty, sun]]).

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

%tiles([red-turtle, blue-turtle, yellow-turtle, purple-turtle, orange-turtle, red-leaf]).




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




menu:-
  repeat,
  write('                          '),nl,
  write('   1. Player vs Player '),nl,
  write('   2. Player vs PC     '),nl,
  write('   3. Quit             '),nl,
  write('enter your choice:'), nl,
  read(Choice), write('atao2'), nl, Choice > 0, Choice =< 3,
  doit(Choice), Choice = 3.



doit(1):-
  write('Player vs Player'), nl,
  drawBoardHeader,
  tabuleiroIntermedio(Tab),
  drawBoard(Tab, 0), !,
  write('atao'), nl.


doit(2):-
  write('Player vs PC'), nl.

doit(3):- !.





drawTitle:-
  nl,
  write('========================================'), nl,
  write('----------------LATICE------------------'), nl,
  write('========================================'), nl,
  nl.

drawBoardHeader:-
  write('   | A | B | C | D | E | F | G | H | I '), nl,
  write('---|---|---|---|---|---|---|---|---|---|'), nl.

latice:-
  drawTitle,
  menu.
