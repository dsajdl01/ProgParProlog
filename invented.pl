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

some([H|T]) :- something(H,T).
something(X,[X]).
something(X,[_|T]) :- something(X,T).

% Result;
% ?- some([1]). 			;=>  false.
% ?- some([1,4]). 			:=>  false.
% ?- some([1,1]).			;=>  true ;  false.
% ?- some([1,2,3,4,5,1]). 	;=>  true ;  false.
% ?- some([1,2,3,4,5,1,5]).	;=>  false.
%
% ?- something(X,[1,2,3,4]). 	;=> X = 4 ; false.
% ?- something(X,[1]). 			:=> X = 1 ; false.
% ?- something(X,[]). 			;=> false.
% ?- something(X,[_]). 			;=> true .

duplicate([X,X|_],X).
duplicate([_|T],X):- duplicate(T,X).

% Result;
% ?- duplicate([1,2,4,4,5,6,4,3,3],X). 		;=>  X = 4 ;  X = 3 ;  false.
% ?- duplicate([1,2,4,5,6,4,3,3],X).		;=>  X = 3 ;  false.
% ?- duplicate([1,2,4,5,6,4,3,33],X).		:=>  false.

revAppend([], X, X).
revAppend([X|Y], Z, W) :- revAppend(Y, [X|Z], W).

% Result;
% ?- revAppend([3,2,1], [], [1,2,3]). 		;=>  true.
% ?- revAppend([1,2,3],[],L).				;=>  L = [3, 2, 1].
% ?- revAppend([1,2,3],First,Last).			:=>  Last = [3, 2, 1|First].
% ?- revAppend(F, [], [1,2,3,4]). 			;=>  F = [4, 3, 2, 1] ; ERROR: Out of global stack
% ?- revAppend(First, Last, [1,2,3]). 		:=>  First = [],   		Last = [1, 2, 3] ;
%												 First = [1],  		Last = [2, 3] ;
% 												 First = [2, 1],  	Last = [3] ;
%												 First = [3, 2, 1], Last = [] ;
%



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

