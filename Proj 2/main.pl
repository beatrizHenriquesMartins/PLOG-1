:-use_module(library(clpfd)).
:-use_module(library(lists)).
:-consult(gets).
:-consult(mercado).
:-consult(display).

ementa:- 
    listar_mercado(Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes),
    get_ementa_diaria(100, Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes, 1).