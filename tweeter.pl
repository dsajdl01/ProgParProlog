followed(anna,	fred).
followed(fred, 	julia).
followed(fred, 	susan).
followed(john, 	fred).
followed(julia, fred).
followed(susan,	john).
followed(susan,	julia).

tweeted(anna,	tweet1).
tweeted(anna,	tweet5).
tweeted(fred, 	tweet2).
tweeted(fred, 	tweet7).
tweeted(fred, 	tweet8).
tweeted(john, 	tweet3).
tweeted(john, 	tweet4).
tweeted(julia, 	tweet6).
tweeted(susan, 	tweet9).
tweeted(susan, 	tweet10).

can_see(X,Y) :- followed(X,Z),tweeted(Z,Y)|tweeted(X,Y).
friends(X,Y) :- followed(X,Y)|followed(Z,Y),followed(X,Z),\+(X=Y),\+(X=Z).
retweeted(X,Y) :- tweeted(X,Y)|followed(X,Z),tweeted(Z,Y).
