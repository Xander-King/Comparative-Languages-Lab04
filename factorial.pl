% Compute the factorial function 
%   n! = n*(n-1)!
%   0! = 1

%% TODO -- Put your implementation here

%% Testing

:- fact(5, X), format('5! is ~d~n', X), !.
:- fact(0, X), format('0! is ~d~n', X), !.
:- fact(1, X), format('1! is ~d~n', X), !.
:- fact(3, X), format('3! is ~d~n', X), !.
:- fact(7, X), format('7! is ~d~n', X), !.
