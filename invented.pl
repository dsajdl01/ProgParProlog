invented(edison,lightbulb).
invented(colmeraurer,prolog).
iq(einstein,210).
iq(edison,160).
iq(waldorf,90).
genius(P) :-
		iq(P,IQ),
		IQ > 150.
genius(P):-
		invented(P,_).

smatr_invention(P):-
			iq(P,B),
			B >= 60.

no_beam :-
		genius(P),
		write('I found intelligent life, sir!'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  http:///www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse16  %%


%% Exercise 4.3
second(_,[]).
second(X,[_,S|_]) :- (X = S).


%% Exercise 4.4
swop12([X,X1|Tail], [Y,Y1| Tail1]):- (Y = X1), 
									(Y1 = X), 
									(Tail = Tail1).
%% Exercise 4.5
tran(eins, one).
tran(zwei, two).
tran(drei, three).
tran(vier, four).
tran(fuenf, five).
tran(sechs, six).
tran(sieben, seven).
tran(acht, eight).
tran(neun, nine).

listtran([],[]).
listtran(G, [E|Tail]):- listtran(Add, Tail),
						tran(GmNum, E),
						append([GmNum], Add, G),!.

listtran([],[]).
listtran([G|Tail],E):- listtran(Tail, Add),
						tran(G, EnNum),
						append([EnNum], Add, E),!.

%% Exercise 4.6
twice([],[]).
twice([H|T],Result):-
			twice(T, Rest),
			append([H,H], Rest, Result).