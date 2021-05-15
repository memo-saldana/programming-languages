-module(hw14).
-export([start/0]).

% ====================
% Complete the following functions and submit your file to Canvas.
% ====================
% Do not change the names of the functions. 
% Do not change the number of arguments in the functions.
% If your file cannot be loaded by the Erlang compiler, your submission may be cancelled. 
% Then, submit only code that works.
% ====================
% Grading instructions:
% There is a series of test cases for each function. In order to state that your function
% "works as described", your output must be similar to the expected one in each case.

% === pow ===

pow(N, X) -> powAux(N, X, 1).

powAux(_, X, R) when X == 0 -> R;
powAux(N, X, R) -> powAux(N, X-1, R*N).

% === fibinacci ===

fibonacci(N) -> fiboAux(N, 0, 1).

fiboAux(0, A, _) -> A;
fiboAux(N, A, B) -> fiboAux(N-1, B, A+B).

% === reverse ===

reverse(L) -> revAux(L, []).

revAux([],Rev) -> Rev;
revAux([H | T], R) -> revAux(T, [H | R]).

% === count ===

count(L, N) -> countAux(L, N, 0).

countAux([], _, R) -> R;
countAux([N | T], N, R) -> countAux(T, N, R+1);
countAux([_ | T], N, R) -> countAux(T, N, R).

% === sum ===

sum(L) -> sumAux(L, 0).

sumAux([],R) -> R;
sumAux([H | T], R) -> sumAux(T, R+H).

% === Test cases ===

start() -> 
	io:format("=== pow ===~n"),
	io:format("~p~n", [pow(2, 10)]), % 1024
	io:format("~p~n", [pow(5, 3)]), % 125
	io:format("=== fibonacci ===~n"),
	io:format("~p~n", [fibonacci(5)]), % 5
	io:format("~p~n", [fibonacci(10)]), % 55
	io:format("=== reverse ===~n"),	
	io:format("~p~n", [reverse([33, 45, 18, 17, 25, 62, 100])]), % [100,62,25,17,18,45,33]
	io:format("~p~n", [reverse([10, 20, 30, 40, 50])]), % [50,40,30,20,10]
	io:format("=== count ===~n"),
	io:format("~p~n", [count([1, 2, 3, 4, 5, 5, 4, 3, 2, 1, 1], 1)]), % 3
	io:format("~p~n", [count([1, 2, 3, 4, 5, 3, 10, 3, 5, 3, 4, 3, 2, 1, 1, 3], 3)]), % 6
	io:format("=== sum ===~n"),
	io:format("~p~n", [sum([33, 45, 18, 17, 25, 62, 100])]), % 300
	io:format("~p~n", [sum([10, 20, 30, 40, 50])]). % 150