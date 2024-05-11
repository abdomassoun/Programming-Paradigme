:- use_module(library(lists), [append/3]).
shunt(In,Out,Moves) :-
StartNode = node(In,[],[]),
EndNode = node(Out,[],[]),
LastTrack = two,
length(Moves,_),
path(Moves,StartNode,EndNode,LastTrack),
!.
path([],Node,Node,_).
path([OtherTrack/N|Moves],Node,EndNode,LastTrack) :-
opposite(LastTrack,OtherTrack),
edge(Node,NextNode,OtherTrack,N),
path(Moves,NextNode,EndNode,OtherTrack).
edge(node(X1,A1,B), node(X2,A2,B), one, N) :- pop(A1,A2,X1,X2,N).
edge(node(X1,A1,B), node(X2,A2,B), one, N) :- push(A1,A2,X1,X2,N).
edge(node(X1,A,B1), node(X2,A,B2), two, N) :- pop(B1,B2,X1,X2,N).
edge(node(X1,A,B1), node(X2,A,B2), two, N) :- push(B1,B2,X1,X2,N).
pop(A1,A2,X1,X2,N) :-
append(F,A2,A1),
F \== [],
append(X1,F,X2),
length(F,M),
N is -M.
push(A1,A2,X1,X2,N) :-
append(X2,F,X1),
F \== [],
append(F,A1,A2),
length(F,N).
opposite(one,two).
opposite(two,one).
