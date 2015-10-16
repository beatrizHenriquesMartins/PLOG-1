homem(rui).
homem(joao).
homem(alberto).
homem(joaquim).
homem(romeu).
mulher(maria).
mulher(ana).
mulher(julieta).
mulher(albertina).
mulher(carolina).

pai(rui,maria).
pai(rui,alberto)
pai(joao,rui).
mae(ana,joaquim).
mae(carolina,rui).
mae(albertina,alberto).
mae(albertina,maria).
pai(P) :- pai(P,_).
mae(M) :- mae(M,_).

filho(F,X) :- pai(X,F),homem(F).
filho(F,X) :- mae(X,F),homem(F).
filha(F,X) :- pai(X,F),mulher(F).
filha(F,X) :- mae(X,F),mulher(F).

irmao(I1,I2) :- pai(X,I1), pai(X,I2), mae(M,I1), mae(M,I2), homem(I1), I1 \= I2.
irma(I1,I2) :- pai(X,I1), pai(X,I2), mae(M,I1), mae(M,I2), mulher(I1), I1 \= I2.

meioirmao(I1,I2) :- pai(X,I1), pai(X,I2), mae(M1,I1), mae(M2,I2), homem(I1), I1 \= I2, M1 \= M2.
meioirmao(I1,I2) :- pai(X1,I1), pai(X2,I2), mae(M,I1), mae(M,I2), homem(I1), I1 \= I2, X1 \= X2.
meioirma(I1,I2) :- pai(X,I1), pai(X,I2), mae(M1,I1), mae(M2,I2), mulher(I1), I1 \= I2, M1 \= M2.
meioirma(I1,I2) :- pai(X1,I1), pai(X2,I2), mae(M,I1), mae(M,I2), mulher(I1), I1 \= I2, X1 \= X2.



