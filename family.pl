% Famuly Tree

% Facts 
male(jack).
male(oliver).
male(ali).
male(james).
male(simon).
male(harry).
female(helen).
female(sophie).
female(jess).
female(lily).
female(sarah).

parent_of(jack,jess). % jack is the parent of jess
parent_of(jack,lily).
parent_of(jack, sarah).
parent_of(helen, jess).
parent_of(helen, lily).
parent_of(oliver,james).
parent_of(sophie, james).
parent_of(jess, simon).
parent_of(ali, simon).
parent_of(lily, harry).
parent_of(james, harry).

 
% Rules 
%  NOTE: If possible, avoid using 
%        disjunction (;) in your rules

%TODO: Write father_of/2
father_of(F, C) :- parent_of(F, C), male(F). 
% F is the father of C if F is the parent of C and F is male

%TODO: Write mother_of/2
mother_of(M, C) :- parent_of(M, C), female(M).
% M is the mother of C if M is the parent of C and M is female

%TODO: Write grandfather_of/2
grandfather_of(G, C) :- 
   father_of(G, Somebody), 
   parent_of(Somebody, C).

%TODO: Write grandmother_of/2
grandmother_of(G, C) :- 
   mother_of(G, Somebody),
   parent_of(Somebody, C).

%TODO: Write sister_of/2
sister_of(S, B) :- 
   parent_of(Somebody, S),
   parent_of(Somebody, B),
   female(S),
   S \= B.

%TODO: Write aunt_of/2
aunt_of(A, C) :-
   parent_of(Somebody, C),
   sister_of(A, Somebody).
 
%TODO: Write ancestor_of/2
ancestor_of(A, B) :- 
   parent_of(A, C),
   ancestor_of(C, B).
   ancestor_of(X, Y) :- parent_of(X, Y).

%Tests

:- mother_of(X, jess), format('The mother of ~w is ~w~n', [jess,X]).
:- father_of(X, jess), format('The father of ~w is ~w~n', [jess,X]).

:- setof(X, grandfather_of(X, harry), Set),
   forall(member(G, Set), format('A grandfather of ~w is ~w~n', [harry,G])).

:- setof(X, grandmother_of(X, harry), Set),
   forall(member(G, Set), format('A grandmother of ~w is ~w~n', [harry,G])).

:- setof(X, ancestor_of(X, harry), Ancestors), 
   forall(member(A, Ancestors), format('~w is an ancestor of ~w~n', [A, harry])).

:- setof(C, sister_of(C, lily), Sisters), 
   forall(member(S, Sisters), format('~w is ~w\'s sister~n', [S, lily])).

:- setof(C, aunt_of(C, harry), Set), 
   forall(member(S, Set), format('~w is ~w\'s aunt~n', [S, harry])).


