-module(activity07).
-import(lists, [map/2, filter/2]).
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

% === multiplesR ===

multiplesR([], _) -> [];
multiplesR([H | T], X) when H rem X == 0 -> [H | multiplesR(T, X)];
multiplesR([_ | T], X) -> multiplesR(T, X).

% === multiplesHOF ===

multiplesHOF(L, N) -> filter(fun(Y) -> Y rem N == 0 end, L).

% === take ===

take([], _) -> [];
take(_, X) when 0 >= X -> [];
take([H | T], X) -> [H | take(T, X-1)]. 

% === drop ===

drop([], _) -> [];
drop(L, X) when 0 >= X -> L;
drop([_ | T], X) -> drop(T, X-1).

% === unique ===

unique([]) -> [];
unique([X]) -> [X];
unique([H | T]) -> [H | unique(filter(fun(N) -> H /= N end, T))].

% === transpose ===

transpose([[] | _]) -> [];
transpose(M) -> [map(fun(L) -> hd(L) end, M) | transpose(map(fun(L) -> tl(L) end, M))].

% === qsort ===

qsort([]) -> [];
qsort([N]) -> [N];
qsort([H | T]) -> qsort(filter(fun(X) -> X =< H end, T)) ++ [H] ++ qsort(filter(fun(X) -> X > H end, T)).

% === Test cases ===

start() -> 
	io:format("=== multiplesR ===~n"),
	io:format("~p~n", [multiplesR([1, 4, 6, 7, 23, 39, 19, 3], 3)]), % [6,39,3]
	io:format("~p~n", [multiplesR([1, 4, 6, 8, 7, 12, 19, 3], 2)]), % [4,6,8,12]
	io:format("=== multiplesHOF ===~n"),
	io:format("~p~n", [multiplesHOF([1, 4, 6, 7, 23, 39, 19, 3], 3)]), % [6,39,3]
	io:format("~p~n", [multiplesHOF([1, 4, 6, 8, 7, 12, 19, 3], 2)]), % [4,6,8,12]
	io:format("=== take ===~n"),
	io:format("~p~n", [take([1, 4, 6, 7, 23, 39, 19, 3], 5)]), % [1,4,6,7,23]
	io:format("~p~n", [take([1, 4, 6, 8, 7, 12, 19, 3], 7)]), % [1,4,6,8,7,12,19]
	io:format("~p~n", [take([10, 20, 30, 40, 50, 60, 70, 80], 6)]), % [10,20,30,40,50,60]
	io:format("=== drop ===~n"),
	io:format("~p~n", [drop([1, 4, 6, 7, 23, 39, 19, 3], 5)]), % [39,19,3]
	io:format("~p~n", [drop([1, 4, 6, 8, 7, 12, 19, 3], 7)]), % [3]
	io:format("~p~n", [drop([10, 20, 30, 40, 50, 60, 70, 80], 6)]), % "FP"
	io:format("=== unique ===~n"),
	io:format("~p~n", [unique([1, 4, 4, 2, 1, 6, 7, 6, 4, 2, 7, 6, 2, 1])]), % [1,4,2,6,7]
	io:format("~p~n", [unique([3, 6, 5, 4, 3, 3, 5, 6, 4, 2, 9, 1, 2, 2, 4, 3, 8, 9])]), % [3,6,5,4,2,9,1,8]
	io:format("=== transpose ===~n"),
	io:format("~p~n", [transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]])]), % [[1,4,7],[2,5,8],[3,6,9]]
	io:format("=== qsort ===~n"),
	io:format("~p~n", [qsort([1, 4, 6, 7, 23, 39, 19, 3])]), % [1,3,4,6,7,19,23,39]
	io:format("~p~n", [qsort([1, 4, 4, 2, 1, 6, 7, 6, 4, 2, 7, 6, 2, 1])]). % [1,1,1,2,2,2,4,4,4,6,6,6,7,7]