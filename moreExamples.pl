
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create predicete to Factorial number e.g. f(5,X) where X = 120
fac(1,1).
fac(N,F) :- NAUX is N - 1, fac(NAUX,FAUX), F is N * FAUX.

% Result:
% ?- fac(5,X).  	;=>  X = 120 .
% ?- fac(4,X).		;=>  X = 24 .
% ?- fac(7,X).		;=>  X = 5040 .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create predicete to reverse list e.g. rev([1,3,6],X) X = [6,3,1]

myrevers([],[]).
myrevers([H|T], Rev) :- myrevers(T, Trev), append(Trev, [H], Rev).


my_reverse2(L,R) :- getReverse(L,R,[]).

getReverse([], L, L).
getReverse([H|T], Y, R) :-
			getReverse(T, Y, [H|R]).


% Result;
% ?- myrevers([1,2,3,4,5], X). 				;=>  X = [5, 4, 3, 2, 1].
% ?- myrevers([a, b, r, x, z], X).			:=>  X = [z, x, r, b, a].
%
% ?- my_reverse2([1,2,3],X). 				;=>  X = [3, 2, 1].
% ?- my_reverse2([1,2,3,4,5,6,7,8],X).  	;=>  X = [8, 7, 6, 5, 4, 3, 2, 1].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% white predicete to get sum of integer e.g getsum(4,X) = X = 10
sum_to(N,1) :- N =< 1.
sum_to(N, Result) :- N > 1,
					TemN is N - 1,
					sum_to(TemN, TepRes),
					Result is TepRes + N,!.

% Result;
% ?- sum_to(5,X). 		;=>  X = 15 .
% ?- sum_to(30,X).		;=>	 X = 465 .
% ?- sum_to(4,X).		;=>  X = 10 .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write predicete to append one list to another 
% e.g. myapp([1,2,3],[a,b,c], X) X = [1, 2, 3, a, b, c]
% then using created yourappend write predicete for prefix and suffix
% prefix(X,Y) is true if the list presented by X is a prefix of the list presented by Y
% suffix(X,Y) is true if the list presented by x is a suffix of the list presented by Y 

myAppend([], Y, Y).
myAppend([H|T], Y, [H|Rest]) :- myAppend(T, Y, Rest).

prefix(X, Y) :- myAppend(X, _, Y).
suffix(A, B) :- myAppend(_, A, B).

% Result;
% ?- myAppend([1,2,3,4],[a,b,c,d],X).		;=> 	X = [1, 2, 3, 4, a, b, c, d].
% ?- myAppend([bob, fred, john],[x,q,z],X). ;=> 	X = [bob, fred, john, x, q, z].
%
% ?- prefix(X,[a,b]). 	;=>  X = [] ;
%						;=>  X = [a] ;
%						;=>  X = [a, b] ;
%						;=>	 false.
%
% ?- prefix([a,b],X). 	;=>  X = [a, b|_G936].
%
% ?- suffix([a,b],X).	;=>  X = [a, b] ;
%						;=>  X = [_G932, a, b] ;
%						:=>  X = [_G932, _G938, a, b] ;
%						:=>  X = [_G932, _G938, _G944, a, b] .
%
% ?- suffix(X, [a,b]).	;=>  X = [a, b] ;
%						;=>  X = [b] ;
%						;=>  X = [] ;
%						;=>  false.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write predicete which give a position integer of N, and returns a list or sequence of the integers N inclusive through 1 inclusive.
% e.g. getList(5,[5,4,3,2,1]) 

getlist(0, []).
getlist(X,[X|List]) :- Prev is X - 1, getlist(Prev, List),!.

getListRev(X, List) :- getmyList(X, 1, List).

getmyList(X, X , [X]).
getmyList(X, Y, [Y|List]) :- (Y < X),
							NewY is Y + 1,
							getmyList(X, NewY, List),!.							

% Result 
% ?- getlist(5,X). 			;=>  X = [5, 4, 3, 2, 1] .
% ?- getlist(10,X). 		;=>  X = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1] 
%
% ?- getListRev(4,X). 		;=>  X = [1, 2, 3, 4].
% ?- getListRev(12,X). 		;=>  X = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write predicate which give 2 integers Y X and returns a list of integers between Y and Y inclusive
% It should work both way if the X is smaller than Y then the list produce integers from X to Y e.g. numbet(1,4,[1,2,3,4]).
% if the X is greater than Y then the list produce integers from X to Y e.g. numbet(4,1,[4,3,2,1]). 

numbertween(X, X, [X]).
numbertween(X, Y, [X|List]) :- (X < Y),
						NewX is X + 1,
						numbertween(NewX,Y, List).
numbertween(X, X, [X]).
numbertween(X, Y, [X|List]) :- (X > Y),
						NewX is X - 1,
						numbertween(NewX, Y, List).

% Result;
% ?- numbertween(5,11,X). 		;=>  X = [5, 6, 7, 8, 9, 10, 11] .
% ?- numbertween(-2,2,X). 		:=>  X = [-2, -1, 0, 1, 2] .
% ?- numbertween(3,-2,X). 		;=>  X = [3, 2, 1, 0, -1, -2] .
% ?- numbertween(58,49,X). 		;=>  X = [58, 57, 56, 55, 54, 53, 52, 51, 50, 49] .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write predicete which get integer and returns fibonacci number of the paricular integer, e.g f(3,X) ;=> X = 2

fib(0,0).
fib(1,1).
fib(N,F) :- N1 is N - 1,
			N2 is N - 2,
			fib(N1, F1),
			fib(N2, F2),
			F is F1 + F2,!.

% Result
% ?- fib(12,X). 	;=>  X = 144.
% ?- fib(7,X). 		;=>  X = 13.
% ?- fib(3,X). 		;=>  X = 2.
% ?- fib(1,X). 		;=>  X = 1 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% write predicete which check if first value is a member of the list e.g. mem(a,[a,b,c,a]) = true, true, false

is_member(X, [H|T]) :- X = H;
					is_member(X, T).

is_member2(X,L) :- append(_,[X|_], L).

% Result
% ?- is_member(4,[1,2,3,4]).  		;=>  true .
% ?- is_member(4,[1,4,3,4]). 		;=>  true ; true ; false.
% ?- is_member(a,[a,b,c,d,a,r,k]).  ;=>  true ; true ; false.
% ?- is_member(f,[a,b,c,d,a,r,k]).  :=>  false.
%
% ?- is_member2(f,[a,b,c,d,a,r,k]). 	;=>  false.
% ?- is_member2(f,[a,b,c,d,a,r,k,f]).	;=>  true ; false.
% ?- is_member2(a,[a,b,c,d,a,r,k,f]). 	;=>  true ; true ; false.

