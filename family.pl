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
 
%TODO: Write mother_of/2

%TODO: Write grandfather_of/2
 
% TODO: Write grandmother_of/2

% TODO: Write sister_of/2
%      HINT: Use multiple clauses instead of disjunction
 

% TODO: Write aunt_of/2

 
% TODO: Write ancestor_of


%% Tests

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


