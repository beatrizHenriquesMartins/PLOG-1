%bases sopa
mercado(batata, 2, 590).       %1
mercado(abobora, 3, 700).      %2


%vegetais
mercado(brocolos, 2, 500).        %3
mercado(couve, 1, 603).          %4
mercado(couve_branca, 3, 900).   %5
mercado(espinafres, 2, 308).     %6
mercado(vagens, 3, 489).         %7


%carne
mercado(frango, 5, 351).      %8
mercado(porco,  7, 281).      %9
mercado(bifes,  8, 493).   %10
mercado(panados, 3, 307).   %11
mercado(peru, 3, 800).    %12


%peixe
mercado(abrotea, 1, 420).  %13
mercado(pescada, 3, 387).   %14
mercado(salmao, 8, 233).    %15
mercado(bacalhau, 5, 345).   %16
 

%bases prato principal
%batata-1
mercado(arroz, 1, 901).  %17
mercado(massa, 1, 803).  %18


%saladas
mercado(cenoura, 1, 300).   %19
mercado(pepin, 2, 420).     %20
mercado(tomate, 4, 300).    %21
mercado(alface, 3, 901).    %22
mercado(couve_roxa, 2, 513). %23
mercado(cebola, 1, 501).     %24


%sobremesa - fruta
mercado(laranja, 3, 200).   %25
mercado(maca, 1, 400).      %26
mercado(banan, 4, 200).     %27
mercado(pera, 1, 700).      %28


%sobremesa - doce
mercado(arroz_doce, 3, 300).   %29
mercado(aletria, 3, 212).     %30
mercado(gelatina, 2, 812).    %31
mercado(pudim, 1, 356).       %32





listar_mercado(Lista_Nomes_Ingredientes, Lista_Custos_Ingredientes, Lista_Quantidades_Ingredientes):-

	%bases sopa
	mercado(batata, C1, Q1),       %1
	mercado(abobora, C2, Q2),      %

	%vegetais
	mercado(brocolos, C3, Q3),        %3
	mercado(couve, C4, Q4),          %4
	mercado(couve_branca, C5, Q5),   %5
	mercado(espinafres, C6, Q6),     %6
	mercado(vagens, C7, Q7),         %7


	%carne
	mercado(frango, C8, Q8),      %8
	mercado(porco,  C9, Q9),      %9
	mercado(bifes,  C10, Q10),   %10
	mercado(panados, C11, Q11),   %11
	mercado(peru, C12, Q12),    %12


	%peixe
	mercado(abrotea, C13, Q13),  %13
	mercado(pescada, C14, Q14),   %14
	mercado(salmao, C15, Q15),    %15
	mercado(bacalhau, C16, Q16),   %16
	 

	%bases prato principal
	mercado(arroz, C17, Q17),  %17
	mercado(massa, C18, Q18),  %18


	%saladas
	mercado(cenoura, C19, Q19),   %19
	mercado(pepin, C20, Q20),     %20
	mercado(tomate, C21, Q21),    %21
	mercado(alface, C22, Q22),    %22
	mercado(couve_roxa, C23, Q23), %23
	mercado(cebola, C24, Q24),     %24


	%sobremesa - fruta
	mercado(laranja, C25, Q25),   %25
	mercado(maca, C26, Q26),      %26
	mercado(banan, C27, Q27),     %27
	mercado(pera, C28, Q28),      %28


	%sobremesa - doce
	mercado(arroz_doce, C29, Q29),   %29
	mercado(aletria, C30, Q30),     %30
	mercado(gelatina, C31, Q31),    %31
	mercado(pudim, C32, Q32),       %32

	append([], [batata, abobora, brocolos, couve, couve_branca, espinafres, vagens, frango, porco, bifes, panados, peru, abrotea, pescada, salmao, bacalhau, arroz,
				massa, cenoura, pepin, tomate, alface, couve_roxa, cebola, laranja, maca, banan, pera, arroz_doce, aletria, gelatina, pudim], Lista_Nomes_Ingredientes),
	append([], [C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,C23,C24,C25,C26,C27,C28,C29,C30,C31,C32], Lista_Custos_Ingredientes),
	append([], [Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31,Q32], Lista_Quantidades_Ingredientes).
