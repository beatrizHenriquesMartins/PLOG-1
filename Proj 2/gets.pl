

get_base_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Base_Sopa, Preco_Base, Numero_Pratos):-
        domain([Base_Sopa], 1, 2),
        element(Base_Sopa, Lista_Custos_Ingredientes, Preco_Base),
        element(Base_Sopa, Lista_Quantidades_Ingredientes, Quantidade_Base),


        Quantidade_Base #>= Numero_Pratos.


get_vegetal_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Vegetal_Sopa, Preco_Vegetal, Numero_Pratos):-
        domain([Vegetal_Sopa], 3, 7),
        element(Vegetal_Sopa, Lista_Custos_Ingredientes, Preco_Vegetal),
        element(Vegetal_Sopa, Lista_Quantidades_Ingredientes, Quantidade_Vegetal),

        
        Quantidade_Vegetal #>= Numero_Pratos.
                         


%peixe
get_principal_prato(0, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Principal, Preco_Principal, Numero_Pratos):-
         
         domain([Ingrediente_Principal], 13, 16),
         element(Ingrediente_Principal, Lista_Custos_Ingredientes, Preco_Principal),
         element(Ingrediente_Principal, Lista_Quantidades_Ingredientes, Quantidade_Principal),

         Quantidade_Principal #>= Numero_Pratos.


%carne
get_principal_prato(1, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Principal, Preco_Principal, Numero_Pratos):-
         
         domain([Ingrediente_Principal], 8, 12),
         element(Ingrediente_Principal, Lista_Custos_Ingredientes, Preco_Principal),
         element(Ingrediente_Principal, Lista_Quantidades_Ingredientes, Quantidade_Principal),

         Quantidade_Principal #>= Numero_Pratos.


get_acompanhamento_prato(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Base, Preco_Acompanhamento, Numero_Pratos):-
      
        domain([Ingrediente_Base], 17, 18),
        element(Ingrediente_Base, Lista_Custos_Ingredientes, Preco_Acompanhamento),
        element(Ingrediente_Base, Lista_Quantidades_Ingredientes, Quantidade_Acompanhamento),

        Quantidade_Acompanhamento #>= Numero_Pratos.



get_salada(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Salada_1, Salada_2, Salada_3, Preco_Salada, Numero_Pratos):-
        
        Legumes = [Salada_1,Salada_2,Salada_3],
        domain(Legumes, 19, 24),
        all_different(Legumes),

        element(Salada_1, Lista_Custos_Ingredientes, Preco1),
        element(Salada_2, Lista_Custos_Ingredientes, Preco2),
        element(Salada_3, Lista_Custos_Ingredientes, Preco3),
        element(Salada_1, Lista_Quantidades_Ingredientes, Quantidade1),
        element(Salada_2, Lista_Quantidades_Ingredientes, Quantidade2),
        element(Salada_3, Lista_Quantidades_Ingredientes, Quantidade3),

        Preco_Salada #= (Preco1 + Preco2 + Preco3)/3,
        Quantidade1 #>= Numero_Pratos,
        Quantidade2 #>= Numero_Pratos,
        Quantidade3 #>= Numero_Pratos.

get_sobremesa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Fruta_1, Fruta_2, Fruta_3, Doce, Preco_Sobremesa, Numero_Pratos):-
    
    Frutas = [Fruta_1, Fruta_2, Fruta_3],
    domain(Frutas, 25, 28),
    all_different(Frutas),

    element(Fruta_1, Lista_Custos_Ingredientes, Preco1),
    element(Fruta_2, Lista_Custos_Ingredientes, Preco2),
    element(Fruta_3, Lista_Custos_Ingredientes, Preco3),        
    element(Fruta_1, Lista_Quantidades_Ingredientes, Quantidade1),
    element(Fruta_2, Lista_Quantidades_Ingredientes, Quantidade2),
    element(Fruta_3, Lista_Quantidades_Ingredientes, Quantidade3),

    Quantidade1 #>= Numero_Pratos,
    Quantidade2 #>= Numero_Pratos,
    Quantidade3 #>= Numero_Pratos,

    domain([Doce], 29, 32),
    element(Doce, Lista_Custos_Ingredientes, Preco_Doce),
    element(Doce, Lista_Quantidades_Ingredientes, Quantidade_Doce),

    Quantidade_Doce #>= Numero_Pratos,

    Preco_Sobremesa #= ((Preco1 + Preco2 + Preco3)/3 + Preco_Doce)/2.



get_ementa_diaria(_, _, _, _, Dia_Da_Semana):-
    Dia_Da_Semana = 6.

get_ementa_diaria(Numero_Pratos, Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Dia_Da_Semana) :-
    
    Dia_Da_Semana < 6,

    Peixe_ou_Carne is mod(Dia_Da_Semana, 2),

    Ingredientes = [Base_Sopa, Vegetal_Sopa, Ingrediente_Acompanhamento, Ingrediente_Principal, Salada_1, Salada_2, Salada_3, Fruta_1, Fruta_2, Fruta_3, Doce],

    get_base_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Base_Sopa, Preco_Base, Numero_Pratos),
    get_vegetal_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Vegetal_Sopa, Preco_Vegetal, Numero_Pratos),
    get_principal_prato(Peixe_ou_Carne, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Principal, Preco_Principal, Numero_Pratos),
    get_acompanhamento_prato(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Acompanhamento, Preco_Acompanhamento, Numero_Pratos),
    get_salada(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Salada_1, Salada_2, Salada_3, Preco_Salada, Numero_Pratos),
    get_sobremesa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Fruta_1, Fruta_2, Fruta_3, Doce, Preco_Sobremesa, Numero_Pratos),
              
    Preco #= Preco_Base + Preco_Vegetal + Preco_Principal + Preco_Acompanhamento + Preco_Salada + Preco_Sobremesa,
    labeling([minimize(Preco)], Ingredientes),
     
    display_resultado(Lista_Nomes_Ingredientes, Base_Sopa, Vegetal_Sopa, Ingrediente_Acompanhamento, Ingrediente_Principal, Salada_1, Salada_2, Salada_3, Fruta_1, Fruta_2, Fruta_3, Doce, Preco, Dia_Da_Semana),
    

    Dia_Da_Semana_Novo is Dia_Da_Semana + 1 ,
    update_mercado([Base_Sopa, Vegetal_Sopa, Ingrediente_Acompanhamento, Ingrediente_Principal, Doce], Lista_Quantidades_Ingredientes, Lista_Quantidades_Resultante, Numero_Pratos),
    get_ementa_diaria(Numero_Pratos, Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Resultante, Dia_Da_Semana_Novo). 

update_mercado([], Lista_Quantidades_Ingredientes, Lista_Quantidades_Resultante, _):-
        Lista_Quantidades_Resultante = Lista_Quantidades_Ingredientes.                                 
update_mercado([H|T],Lista_Quantidades_Ingredientes, Lista_Quantidades_Resultante, Numero_Pratos) :-
        
        nth1(H, Lista_Quantidades_Ingredientes, Antigo_Valor),
        Novo_Valor is Antigo_Valor-Numero_Pratos,
        away(Lista_Quantidades_Ingredientes, H, Lista_sem_Valor),
        nth1(H, Nova_lista, Novo_Valor, Lista_sem_Valor),
        update_mercado(T, Nova_lista, Lista_Quantidades_Resultante, Numero_Pratos).
             
             
away([_|T],1,T):-!.
away([H|T],N,[H|L]):- N > 1, Nn is N - 1,!,away(T,Nn,L).