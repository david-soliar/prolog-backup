man(petr).
man(honza).
man(josef).
man(marek).
man(ondra).
man(pavel).
woman(jana).
woman(dagmar).
woman(anna).
woman(iva).
woman(gabriela).
woman(lenka).
woman(irena).
parent(petr, honza).
parent(josef, anna).
parent(josef, pavel).
parent(honza, marek).
parent(marek, ondra).
parent(honza, gabriela).
parent(anna, gabriela).
parent(lenka, irena).
parent(pavel, irena).
parent(dagmar, ondra).
parent(jana, honza).
parent(iva, anna).
parent(iva, pavel).
parent(anna, marek).

mother(X, Y):- parent(X,Y), woman(X).
father(X, Y):- parent(X,Y), man(X).

grandparent(X, Y):- parent(X,Z) , parent(Z,Y).

descendant(X, Y) :- parent(Y, X) ; parent(Y,Z) , descendant(X, Z).

sibling(X,Y):- parent(Z,X), parent(Z,Y), not(X=Y).

cousin(X,Y):- parent(A, X) , sibling(A, B) , parent(B, Y), not(X=Y).

sister(X,Y):- parent(A,X), parent(A,Y), woman(X).

op1(X, Y):- parent(Z, X), sibling(Z, Y), not(Z=Y). 

ancestor(X, Y):- descendant(Y, X).

op2(X,Y) :- ancestor(Z,X), descendant(Y,Z), woman(Y), not(X=Y).
op2(X,Y) :- descendant(Y,X), woman(Y), not(X=Y).
op2(X,Y) :- ancestor(Y,X), woman(Y).

fib(0, 0).
fib(1, 1).
fib(N, R):- A is N-1, fib(A, X), B is N-2, fib(B, Y), R is Y+X.

fact(0, 1).
fact(N, R):- X is N-1, fact(X, M), R is N*M.