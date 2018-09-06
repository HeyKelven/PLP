estudante("Alberto Silva", 1001).
estudante("Carlos Costa", 1002).
estudante("Andrea Matos", 1003).

nota(joao, 5.0).
nota(maria, 6.0).
nota(pedro, 5.0).
nota(augusto, 3.0).
nota(mariana, 9.0).
nota(cleuza, 3.5).
nota(jose, 6.5).
nota(joaquim, 4.5).
nota(ronaldo, 6.5).
nota(mara, -1).
nota(marcos, 14).
nota(victor, 10).


nome_aluno(X) :- estudante(Y, X), write(Y).

mostrar_nota(X) :- nota(X, Y),((Y >= 7, Y =< 10 -> write("Aprovado")) ; (Y >= 5, Y =< 7 -> write("Recuperação")) ; (Y >= 0, Y =< 5 -> write("Reprovado")); write("ERRO")).
