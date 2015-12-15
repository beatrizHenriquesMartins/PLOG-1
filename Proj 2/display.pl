display_dia(1):- write('$ Segunda-Feira $').
display_dia(2):- write('$ Terca-Feira $').
display_dia(3):- write('$ Quarta-Feira $').
display_dia(4):- write('$ Quinta-Feira $').
display_dia(5):- write('$ Sexta-Feira $').



display_resultado(Lista_Nomes_Ingredientes, Base_Sopa, Vegetal_Sopa, Ingrediente_Acompanhamento, Ingrediente_Principal, Salada_1, Salada_2, Salada_3, Fruta_1, Fruta_2, Fruta_3, Doce, Preco, Dia_Da_Semana):-
    nl,
    display_dia(Dia_Da_Semana), nl, nl,

    write('Sopa: '), nl, nl,
    nth1(Base_Sopa, Lista_Nomes_Ingredientes, Nome_BS), write(Nome_BS),
    write(' com '),
    nth1(Vegetal_Sopa, Lista_Nomes_Ingredientes, Nome_VS), write(Nome_VS), nl, nl,
    write('-----------------------------'), nl, nl,


    write('Prato Principal: '), nl, nl,
    nth1(Ingrediente_Acompanhamento, Lista_Nomes_Ingredientes, Nome_A), write(Nome_A),
    write(' com '),
    nth1(Ingrediente_Principal, Lista_Nomes_Ingredientes, Nome_PP), write(Nome_PP), nl, nl,
    write('-----------------------------'), nl, nl,

    write('Saladas: '), nl, nl,
    nth1(Salada_1, Lista_Nomes_Ingredientes, Nome_S1), write('>'), write(Nome_S1), nl,
    nth1(Salada_2, Lista_Nomes_Ingredientes, Nome_S2), write('>'), write(Nome_S2), nl,
    nth1(Salada_3, Lista_Nomes_Ingredientes, Nome_S3), write('>'), write(Nome_S3), nl, nl,
    write('-----------------------------'), nl, nl,

    write('Sobremesas: '), nl, nl,
    write('Fruta: '), nl,
    nth1(Fruta_1, Lista_Nomes_Ingredientes, Nome_F1), write('>'), write(Nome_F1), nl,
    nth1(Fruta_2, Lista_Nomes_Ingredientes, Nome_F2), write('>'), write(Nome_F2), nl,
    nth1(Fruta_3, Lista_Nomes_Ingredientes, Nome_F3), write('>'), write(Nome_F3), nl, nl,

    write('Doce: '), nl,
    nth1(Doce, Lista_Nomes_Ingredientes, Nome_Doce), write('>'), write(Nome_Doce), nl, nl,
    write('-----------------------------'), nl, nl,
    write('Custo total da Refeicao: '), write(Preco), nl, nl,
    write('-----------------------------'), nl,
    write('-----------------------------'), nl.