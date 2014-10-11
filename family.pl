father(peter,sophia).
father(peter,shimon).
father(peter,lucia).
father(david,magda).
father(shimon,monttserat).
father(shimon,fred).
father(shimon,jan).
mother(jolita,magda).

man(shimon).
man(peter).
man(david).
man(fred).
man(jan).

woman(jolita).
woman(sophia).
woman(lucia).
woman(magda).
woman(monttserat).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

couple(X,Y) :- father(X,B), mother(Y,D),(B=D). 

son(X,Y) :- parent(Y,X), man(X).
daughter(X,Y) :- parent(Y,X), woman(X).

grandfather(X,Y) :- father(X,Z), parent(Z,Y).
grandmother(X,Y) :- mother(X,Z), parent(Z,Y).
