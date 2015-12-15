

get_base_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Base_Sopa,Preco_Base, Numero_Pratos):-
        domain([Base_Sopa], 1, 2),
        element(Base_Sopa, Lista_Custos_Ingredientes, Preco_Base),
        element(Base_Sopa, Lista_Quantidades_Ingredientes, Quantidade_Base),


        Quantidade_Base #>= Numero_Pratos.


get_vegetal_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Vegetal_Sopa, Preco_Vegetal, Numero_Pratos):-
        domain([Vegetal_Sopa], 1, 2),
        element(Vegetal_Sopa, Lista_Custos_Ingredientes, Preco_Vegetal),
        element(Vegetal_Sopa, Lista_Quantidades_Ingredientes, Quantidade_v),

        Quantidade_Vegetal #>= Numero_Pratos.
                         


%carne
get_prato_principal(1, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Principal, Preco_Principal, Numero_Pratos):-
         
         domain([Ingrediente_Principal], 8, 12),
         element(Ingrediente_Principal, Lista_Custos_Ingredientes, Preco_Principal),
         element(Ingrediente_Principal, Lista_Quantidades_Ingredientes, Quantidade_Principal),

         Quantidade_Principal #>= Numero_Pratos.


%peixe
get_prato_principal(2, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Principal, Preco_Principal, Numero_Pratos):-
         
         domain([Ingrediente_Principal], 13, 16),
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
        domain(Legumes,19,24),
        all_different(Legumes),
        element(Salada_1,Lista_Custos_Ingredientes,Preco1),
        element(Salada_2,Lista_Custos_Ingredientes,Preco2),
        element(Salada_3,Lista_Custos_Ingredientes,Preco3),
        Preco_Salada #= Preco1 + Preco2 + Preco3,
        element(Salada_1, ListaQuantidades, Q),
        Q #>= Numero_Pratos,
        element(Salada_2, ListaQuantidades, Q2),
        Q2 #>= Numero_Pratos,
        element(Salada_3, ListaQuantidades, Q3),
        Q3 #>= Numero_Pratos.





init :- 
        random(1, 3, Random),
        domain([Doce],1,5),
        random(0,4,Numero),
        random(0,5,Numero2),
        domain([FrutaEspecial],1,5), 
        FrutaEspecial #\= Doce,
        FrutaEspecial #> Numero2,
        Doce #>Numero,
        listar_mercado(Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes),
       
        %numero de pratos fixo para já

        get_ementa_diaria(1, 0, 100, Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes).





get_ementa_diaria(EscolhaDoce, EscolhaFrutaEspecial, Numero_Pratos, Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes) :-
        Preco_Pao is 1,
        Preco_Agua is 1,

        %ir adicionando
        Vars = [Base_Sopa, Vegetal_Sopa, Ingrediente_Acompanhamento, Ingrediente_Principal],

        get_base_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Base_Sopa, Preco_Base, Numero_Pratos),
        get_vegetal_sopa(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Vegetal_Sopa, Preco_Vegetal, Numero_Pratos),
        get_prato_principal(1, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Principal, Preco_Principal, Numero_Pratos),
        get_acompanhamento_prato(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Ingrediente_Acompanhamento, Preco_Acompanhamento, Numero_Pratos),
        
        %get_salada(Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Salada_1, Salada_2, Salada_3, Preco_Salada, Numero_Pratos),
        %get_fruta(ListaPrecos,F1,F2,F3,PrecoFruta,ListaQuantidades,Numero_Pratos),
       
       
        %doce(ListaPrecos,Doce,PrecoDoce,ListaQuantidades,Numero_Pratos),
       
        Preco #= Preco_Base + Preco_Vegetal, Preco_Principal + Preco_Acompanhamento,
        labeling([minimize(Preco)],Vars),
        
        %imprimeDia(Contador),nl,
        %imprime(Vars,0),nl,
        %write('Gastos(por pessoa): '),write(Preco),put_code(8364),nl,
        write('------------------------------------'),nl
        
       % display_resultado(Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Base_Sopa, Vegetal_Sopa, Ingrediente_Base_Prato, Ingrediente_Principal_Prato, Salada_1, Salada_2, Salada_3),
        
        %updateQuantidades([Base_Sopa, Vegetal_Sopa, Ingrediente_Base_Prato, Ingrediente_Principal_Prato],ListaQuantidades,Result,Numero_Pratos),
        %append(PrecoTotal,[Preco],PrecoTotal1)
        %get_ementa_diaria(Contador1, EscolhaPeixeCarne,EscolhaDoce,EscolhaFrutaEspecial,Numero_Pratos,ListaPrecos,Result,PrecoTotal1).  
        .




display_resultado(Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, Base_Sopa, Vegetal_Sopa, Ingrediente_Base_Prato, Ingrediente_Principal_Prato, Salada_1, Salada_2, Salada_3):-
        
        write('Sopa: '), nl, 
        nth1(Base_Sopa, Lista_Nomes_Ingredientes, Nome_BS), write(Nome_BS),
        write(' com '),
        nth1(Vegetal_Sopa, Lista_Nomes_Ingredientes, Nome_VS), write(Nome_VS),
        write('---------------------------------------------------------'), nl,


        write('Prato Principal: '), nl,
        nth1(Ingrediente_Base_Prato, Lista_Nomes_Ingredientes, Nome_BP), write(Nome_BP),
        write(' com '),
        nth1(Ingrediente_Principal_Prato, Lista_Nomes_Ingredientes, Nome_PP), write(Nome_PP),
        write('---------------------------------------------------------'), nl,

        write('Saladas: '), nl,
        nth1(Salada_1, Lista_Nomes_Ingredientes, Nome_S1), write('>'), write(Nome_S1),
        nth1(Salada_2, Lista_Nomes_Ingredientes, Nome_S2), write('>'), write(Nome_S2),
        nth1(Salada_3, Lista_Nomes_Ingredientes, Nome_S3), write('>'), write(Nome_S3),
        write('---------------------------------------------------------'), nl

        .