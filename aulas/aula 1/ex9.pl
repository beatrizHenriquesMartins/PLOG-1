aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).
frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).
professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).
funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup). 

alunodex(A,X) :- professor(X,C), aluno(A,C).

pertence(P,U) :- frequenta(P,U).
pertence(P,U) :- funcionario(P,U).