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

%% tabuleiroIntermedio([
%%   [sun, empty, empty, empty, sun, purple_flower, green_flower, green_bird, orange_bird],
%%   [empty, sun, empty, empty, empty, empty, green_lizard, green_leaf, empty],
%%   [empty, empty, sun, empty, red_turtle, red_leaf, green_leaf, blue_leaf, empty],
%%   [empty, empty, empty, empty, blue_turtle, blue_leaf, empty, empty, empty],
%%   [sun, empty, empty, yellow_turtle, green_turtle, empty, empty, empty, sun],
%%   [empty, empty, yellow_lizard, yellow_dolphin, empty, empty, empty, empty, empty],
%%   [empty, empty, blue_lizard, blue_dolphin, empty, empty, sun, empty, empty],
%%   [empty, sun, empty, empty, empty, empty, empty, sun, empty],
%%   [sun, empty, empty, empty, sun, empty, empty, empty, sun]]).


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


convertValue(red_turtle) :- write('RT ').
convertValue(blue_turtle) :- write('BT ').
convertValue(yellow_turtle) :- write('YT ').
convertValue(purple_turtle) :- write('PT ').
convertValue(orange_turtle) :- write('OT ').

convertValue(red_leaf) :- write('RL ').
convertValue(green_leaf) :- write('GL ').
convertValue(blue_leaf) :- write('BL ').
convertValue(yellow_leaf) :- write('YL ').
convertValue(purple_leaf) :- write('PL ').
convertValue(orange_leaf) :- write('OL ').

convertValue(red_dolphin) :- write('RD ').
convertValue(green_dolphin) :- write('GD ').
convertValue(blue_dolphin) :- write('BD ').
convertValue(yellow_dolphin) :- write('YD ').
convertValue(purple_dolphin) :- write('PD ').
convertValue(orange_dolphin) :- write('OD ').

convertValue(red_lizard) :- write('RLZ').
convertValue(green_lizard) :- write('GLZ').
convertValue(blue_lizard) :- write('BLZ').
convertValue(yellow_lizard) :- write('YLZ').
convertValue(purple_lizard) :- write('PLZ').
convertValue(orange_lizard) :- write('OLZ').

convertValue(red_flower) :- write('RF ').
convertValue(green_flower) :- write('GF ').
convertValue(blue_flower) :- write('BF ').
convertValue(yellow_flower) :- write('YF ').
convertValue(purple_flower) :- write('PF ').
convertValue(green_turtle) :- write('GT ').
convertValue(orange_flower) :- write('OF ').

convertValue(red_bird) :- write('RB ').
convertValue(green_bird) :- write('GB ').
convertValue(blue_bird) :- write('BB ').
convertValue(yellow_bird) :- write('YB ').
convertValue(purple_bird) :- write('PB ').
convertValue(orange_bird) :- write('OB ').




menu:-
  repeat,
  write('                          '),nl,
  write('   1. Player vs Player '),nl,
  write('   2. Player vs PC     '),nl,
  write('   3. Quit             '),nl,
  write('enter your choice:'), nl,
  read(Choice), Choice > 0, Choice =< 3,
  doit(Choice), Choice = 3.



doit(1):-
  write('Player vs Player'), nl,
  drawBoardHeader,
  tabuleiroInicial(Tab),
  drawBoard(Tab, 0).

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
