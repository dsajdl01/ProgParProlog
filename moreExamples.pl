
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

% Result;
% ?- myrevers([1,2,3,4,5], X). 		;=>  X = [5, 4, 3, 2, 1].
% ?- myrevers([a, b, r, x, z], X).	:=>  X = [z, x, r, b, a].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% white predicete to get sum of integer e.g getsum(4,X) = X = 10
sum_to(N,1) :- N =< 1.
sum_to(N, Result) :- N > 1,
					TemN is N - 1,
					sum_to(TemN, TepRes),
					Result is TepRes + N.

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
% 
getlist(0, []).
getlist(X,[X|List]) :- Prev is X - 1, getlist(Prev, List).
