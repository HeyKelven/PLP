mult(X,1,X).
mult(X,Y,R):- Y > 1,
    S is Y - 1,
    mult(X,S,W),
    R is W + X.

div(X,X,1).
div(X,Y,R) :- Y > 0,
    (Y < X ->
    (S is X - Y,div(S, Y, W),R is W + 1);
     R is 0).

binario(X) :- X >= 2 ->
                    (div(X,2,R), (R >= 2 -> binario(R);
                                         write(1)),
                     Z is X mod 2, write(Z));
                     write(X).

membro(X,[X|_]).
membro(X,[Y|R]) :- X \= Y, membro(X,R).

notmembro(_,[]).
notmembro(X,[Y|R]) :- X \= Y, notmembro(X,R).

fibo(0,0).
fibo(1,1).
fibo(X,R) :- X >= 2 ->
    M is X - 1,
    N is X - 2,
    fibo(M,D),
    fibo(N,E),
    R is D + E.

print_lista([]).
print_lista([X|H]) :- write(X), write(' '),print_lista(H).

print_lista_invertida([]).
print_lista_invertida([X|H]) :- print_lista_invertida(H),write(X), write(' ').

comprimento(0,[]).
comprimento(1,[_]).
comprimento(X,[_|Y]) :- comprimento(S,Y), X is S + 1.

somatorio(X,[X]).
somatorio(X,[A|B]):- somatorio(S,B), X is A + S.

media(X,Y) :- somatorio(S,Y), comprimento(W,Y), div(S,W,X).

concatenar([],V,V).
concatenar([H|A],B,[H|C]) :- concatenar(A,B,C).

inverter([],[]).
inverter(A, [H|B]) :- inverter(X, B), concatenar(X,[H], A).

remove(_,[],[]).
remove(X,[X|A],B) :- remove(X,A,B).
remove(X, [Y|A],[Y|B]) :- X =\= Y, remove(X,A,B).

conta_ocorrencia(_,[],0).
conta_ocorrencia(X,[X|H],N) :- conta_ocorrencia(X,H,S), N is S+1.
conta_ocorrencia(X,[Y|H],N) :- X =\= Y, conta_ocorrencia(X,H,N).

separa([],[],[]).
separa([0|H],A,B):- separa(H,A,B).
separa([X|H],[X|P],N) :- X =\= 0, X > 0, separa(H,P,N).
separa([X|H],P,[X|N]) :- X =\= 0, X < 0, separa(H,P,N).

subset1([],_).
subset1([X|H],Z) :- membro(X,Z), subset1(H, Z).

uniao([],X,X).
uniao([X|H], Y, Z) :- subset1([X],Y) -> uniao(H,Y,Z) ; uniao(H,Y,S), concatenar([X],S,Z).

interseccao([],_,[]).
interseccao([X|H],T,[X|R]) :- interseccao(H,T,R), membro(X,T).
interseccao([X|H],T,R) :- interseccao(H,T,R), notmembro(X,T).

diferente([],_,[]).
diferente([X|H],T,[X|R]) :- notmembro(X,T), diferente(H,T,R).
diferente([X|H],T,R) :- membro(X,T), diferente(H,T,R).
