% Shunt predicate that takes an input list, an output list, and a list of moves
% and checks if it is possible to transform the input list into the output list
% using the given moves.
shunt(In, Out, Moves) :-
    StartNode = node(In, [], []),
    EndNode = node(Out, [], []),
    LastTrack = two,
    length(Moves, _),
    path(Moves, StartNode, EndNode, LastTrack),
    !.

% Base case for the path predicate. If the list of moves is empty, it means
% we have reached the end node and the transformation is complete.
path([], Node, Node, _).

% Recursive case for the path predicate. It checks if it is possible to make
% a move from the current node to the next node using the given move and track.
path([OtherTrack/N|Moves], Node, EndNode, LastTrack) :-
    opposite(LastTrack, OtherTrack),
    edge(Node, NextNode, OtherTrack, N),
    path(Moves, NextNode, EndNode, OtherTrack).

% Predicate to define the edge between two nodes. It checks if it is possible
% to perform a pop or push operation on the input or output list to transform
% from one node to the other.
edge(node(X1, A1, B), node(X2, A2, B), one, N) :- pop(A1, A2, X1, X2, N).
edge(node(X1, A1, B), node(X2, A2, B), one, N) :- push(A1, A2, X1, X2, N).
edge(node(X1, A, B1), node(X2, A, B2), two, N) :- pop(B1, B2, X1, X2, N).
edge(node(X1, A, B1), node(X2, A, B2), two, N) :- push(B1, B2, X1, X2, N).

% Predicate to perform a pop operation. It removes the first element from
% the input list and adds it to the output list, and returns the negation
% of the length of the removed element as N.
pop(A1, A2, X1, X2, N) :-
    append(F, A2, A1),
    F \== [],
    append(X1, F, X2),
    length(F, M),
    N is -M.

% Predicate to perform a push operation. It removes the first element from
% the output list and adds it to the input list, and returns the length of
% the removed element as N.
push(A1, A2, X1, X2, N) :-
    append(X2, F, X1),
    F \== [],
    append(F, A1, A2),
    length(F, N).

% Predicate to determine the opposite track. It maps 'one' to 'two' and 'two'
% to 'one'.
opposite(one, two).
opposite(two, one).
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
