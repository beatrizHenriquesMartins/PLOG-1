% Base de conhecimento

% Sopas - sopa(nome, [ingredientes])

sopa(sopa_batata, [batata, cebola, alho]).
sopa(legumes, [couve, cenoura, couve_branca, abobora, vagens, alho]).
sopa(leguminosa_feijao, [feijao, batata, couve, cenoura, cebola]).
sopa(leguminosa_favas, [favas, cebola, alho, espinafres]).


% Pratos - carne/peixe(nome, [ingredientes])

prato_principal(carne, estrogonoff, [peru, natas, cogumelos, esparguete]).
prato_principal(carne, estufada, [porco, arroz, batata]).
prato_principal(carne, bife_peru, [peru, arroz]).
prato_principal(carne, frango_assado, [frango, batata, arroz]).

prato_principal(peixe, peixe_abrotea, [abrotea, batata]).
prato_principal(peixe, bacalhau_pure, [bacalhau, batata, leite]).
prato_principal(peixe, filetes, [pescada, batata, ovos]).

% Salada

salada(alface).
salada(cebola).
salada(cenoura).
salada(pepin).
salada(tomate).

% Sobremesa

fruta(banan).
fruta(laranja).
fruta(maca).
fruta(melancia).
fruta(pera).

cozida(banan).
cozida(maca).
cozida(pera).

doce(aletria).
doce(arroz_doce).
doce(gelado).
doce(gelatina).
doce(iogurte).
doce(leite_creme).
doce(pudim).

massa(esparguete).

acompanhamento(arroz).
acompanhamento(batata).
acompanhamento(massa(_)).








% Ingrediente

ingrediente(abobora).
ingrediente(abrotea).
ingrediente(alho).
ingrediente(arroz).
ingrediente(bacalhau).
ingrediente(banan).
ingrediente(batata).
ingrediente(cebola).
ingrediente(cenoura).
ingrediente(cogumelos).
ingrediente(couve).
ingrediente(couve_branca).
ingrediente(esparguete).
ingrediente(espinafres).
ingrediente(favas).
ingrediente(feijao).
ingrediente(frango).
ingrediente(laranja).
ingrediente(leite).
ingrediente(maca).
ingrediente(melancia).
ingrediente(natas).
ingrediente(ovos).
ingrediente(pepin).
ingrediente(pera).
ingrediente(peru).
ingrediente(pescada).
ingrediente(porco).
ingrediente(tomate).
ingrediente(vagens).
