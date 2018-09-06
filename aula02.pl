/*Exercicio 01*/

maternidade(joana, pedro).
maternidade(ana, joana).
paternidade(pedro, jose).
paternidade(jose, clara).

avo(X,Y) :- (paternidade(X,Z), paternidade(Z,Y)).

/* Exercicio 02*/

like(maria, comida).
like(mario, vinho).
like(jose, peixe).
like(jose, maria).
like(joao, vinho).
like(joao, maria).

dotheylike(X, Y) :- like(X, Z), like(Y, Z), write(Z).

/* Exercicio 03*/

genitor(paulo, ana).
genitor(paulo, liliane).
genitor(rose, ana).
genitor(rose, liliane).
homem(paulo).
mulher(rose).
mulher(ana).
mulher(liliane).

papi(X, Y) :- genitor(X, Y) , homem(X).
mami(X, Y) :- genitor(X, Y) , mulher(X).
sis(X, Y) :- genitor(Z, X), genitor(Z, Y), mulher(X).
bro(X, Y) :- genitor(Z, X), genitor(Z, Y), homem(X).
voin(X, Y) :- (papi(X, Z), papi(Z, Y)) ; (papi(X, W), mami(W, Y)).
voinha(X, Y) :- (mami(X, Z), papi(Z, Y)) ; (mami(X, W), mami(W, Y)).
pripo(X, Y) :- homem(X), genitor(F,X), genitor(G, Y), (sis(F,G) ; bro(F,G)).
pripa(X, Y) :- mulher(X), genitor(F,X), genitor(G, Y), (sis(F,G) ; bro(F,G)).
tio(X, Y) :- homem(X), genitor(F, Y), (sis(F, X); bro(F,X)).
tia(X, Y) :- mulher(X), genitor(F, Y), (sis(F, X); bro(F,X)).
fio(X, Y) :- genitor(Y, X), homem(X).
fia(X, Y) :- genitor(Y, X), mulher(X).
sograo(X, Y) :- (papi(Y, H), mami(F, H),  papi(X, F)) ; (mami(Y, H), papi(F, H), papi(X, F)).
sogrona(X, Y) :- (papi(Y, H), mami(F, H),  mami(X, F)) ; (mami(Y, H), papi(F, H), mami(X, F)).

/* Exercicio 04*/

eh_par(X) :-  0 is +X mod +2.
maior(A, B ,X) :-  (A > B, X = A) ; (B > A, X = B).
maiorne(A, B) :-  A > B.
soma(A, B, X) :- X is +(A,B).
dobro(X, Y) :- Y is 2 * X.

/* Exercicio 05*/

diga_oi :- write('Qual é o seu nome?'),
    read(Nome),
    write('Olá '),
    write(Nome), nl.
