piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(maclean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

equipa(breitling,lamb).
equipa(redbull,besenyei).
equipa(redbull,chambliss).
equipa(mediterranean_racing,maclean).
equipa(cobra,mangold).
equipa(matador,jones).
equipa(matador,bonhomme).

aviao(lamb, mx2).
aviao(besenyei, edge540).
aviao(chambliss, edge540).
aviao(maclean, edge540).
aviao(mangold, edge540).
aviao(jones, edge540).
aviao(bonhomme, edge540).

circuito(istanbul).
circuito(budapest).
circuito(porto).

vencedor(jones,porto).
vencedor(mangold,budapest).
vencedor(mangold,istanbul).

gates(istanbul,9).
gates(budapest,6).
gates(porto,5).

equipavencedora(E,C) :- equipa(E,P), vencedor(P,C).