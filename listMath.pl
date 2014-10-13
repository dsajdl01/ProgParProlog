count(0,[]).
count(Count,[Head|Tail]) :- count(TailCount,Tail), Count is TailCount + 1.

sum(0,[]).
sum(Total,[Head|Tail]) :- sum(Sum,Tail), Total is Head + Sum.

minus(0,[]).
minus(Total,[Head|Tail]) :- minus(Minus,Tail), Total is Minus-Head.

multiple(1,[]).
multiple(Total,[Head|Tail]) :- multiple(Mul,Tail), Total is Head * Mul.

idiv(1,[]).
idiv(Total,[Head|Tail]) :- idiv(Div,Tail), Total is Head/Div.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum/Count.  

