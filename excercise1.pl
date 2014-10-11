father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).

brother(X,Y) :- father(F,X),father(Z,Y),(F=Z).
cousin(X,Y) :- father(F,X),father(Z,Y),father(C,F),father(C,Z),\+(F=Z).
grandson(X,Y) :- father(Z,Y),father(X,Z).
descendent(X,Y) :- father(X,Y)|father(Z,Y),father(X,Z).
