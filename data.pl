pai(jose, joao).
pai(joao, julio).
pai(julio, jorge).

mulher(sara).
mulher(amanda).
homem(mario).
homem(bruno).
pai(mario, bruno).
pai(mario, amanda).
mae(sara, bruno).
mae(sara, amanda).

filho(X,Y) :- pai(Y,X).
avo(X,Y) :- pai(X,Z), pai(Z,Y).
irmaos(X,Y) :- (mae(M,X), mae(M, Y));(pai(P,X), pai(P,Y)).