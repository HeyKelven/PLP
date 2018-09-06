contar(X, Y) :-  length(X, Y) -> write(Y) ; (W is +(Y,1), contar(X,W)).
iniciar(X) :- Y is 0, (length(X, Y) -> write(Y) ; contar(X, 1)).

countlist(X, Y) :- X = [] -> write(Y) ; (W is +(Y+1), ([_|H]) = X, countlist(H, W)).
contarlist(X) :- Y is 0, X = [] -> write(Y) ; ([_|H] = X), countlist(H, 1).

cola(X, Y, [X|Y]).
