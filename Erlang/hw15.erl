-module(hw15).
-export([test01/0, append/1, test02/0, friend/1, test03/0, marco/3, polo/2, test04/0, bank/1]).

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

% === append ===

append(Lst) -> 
	receive
		N when is_number(N) and (N >= 0) -> append(Lst ++ [N]);
		_ ->  io:format("~p~n", [Lst])
	end.

test01() -> 
	io:format("=== append ===~n"),
	Pid = spawn(hw15, append, [[]]),
	Pid ! 5, 	% Nothing printed on screen.
	Pid ! 10, 	% Nothing printed on screen.
	Pid ! 14, 	% Nothing printed on screen.
	Pid ! x, 	% The process ends and prints [5, 10, 14] on screen.
	Pid ! 5, 	% Nothing happens since the process has already finished.
	ok.			% This is the return value for test01 (it will eventually be printed on screen).

% === friend ===

friend(Color) -> 
	receive
		{Pid, Message} -> Pid ! {self(), Color, Message}, friend(Color);
		{Pid, ColorReceived, Message} -> if
			Color == ColorReceived -> io:format("I received a message from a friend (~p): ~p.~n", [Pid, Message]);
			true -> ok
		end,
		friend(Color)
	end.

test02() -> 
	io:format("=== friend ===~n"),
	P1 = spawn(hw15, friend, [red]),
	P2 = spawn(hw15, friend, [green]),
	P3 = spawn(hw15, friend, [blue]),	
	P4 = spawn(hw15, friend, [green]),
	P1 ! {P2, "A la grande le puse cuca."},
	P2 ! {P4, "Hable más fuerte que tengo una toalla."},
	P3 ! {P4, "Tiene todo el dinero del mundo, pero hay algo que no puede comprar... un dinosaurio."},
	P4 ! {P1, "na na na na na na na na, líder."},
	P4 ! {P2, "¿Qué te pasó, viejo? Antes eras chévere."},
	ok.
	% Only two of the phrases are printed on screen (the PID is likely to be different):
	% I received a message from a friend (<0.227.0>): "Hable más fuerte que tengo una toalla.".
	% I received a message from a friend (<0.229.0>): "¿Qué te pasó, viejo? Antes eras chévere.".
	% ok will eventually be printed on screen.

% === marcopolo ===

marco(PoloId, X, Y) -> 
	PoloId ! {self(), X, Y},
	receive
		{0, 0} -> PoloId ! finish;
		{Xdelta, Ydelta} -> 
			io:format("Marco moves to (~p, ~p) ~n", [X + Xdelta, Y + Ydelta]),
			marco(PoloId, X+Xdelta, Y+Ydelta)
	end.

polo(X, Y) -> 
	if
		(X == -1) and (Y == -1) -> Px = rand:uniform(20), Py = rand:uniform(20);
		true -> Px = X, Py = Y
	end,
	receive
		{Pid, A, B} -> 
			if
				A < Px ->  Xdelta = 1;
				A == Px -> Xdelta = 0;
				true -> Xdelta = -1
			end,
			if
				B < Py -> Ydelta = 1;
				B == Py -> Ydelta = 0;
				true -> Ydelta = -1
			end,
			Pid ! {Xdelta, Ydelta},
			polo(Px, Py);
		finish -> io:format("Marco found me! I was hiding at (~p, ~p).~n",[Px, Py])
	end.

test03() ->
	Xm = rand:uniform(20),
	Ym = rand:uniform(20),			
	io:format("Marco starts at position (~p, ~p)~n", [Xm, Ym]),	
	io:format("Polo is hidden (we do not know where he is)...~n"),
	PoloPid = spawn(hw15, polo, [-1, -1]),
	spawn(hw15, marco, [PoloPid, Xm, Ym]),
	ok.

% === bank ===

deposit([], _, _) -> [];
deposit([{Acc, Bal} | T], Acc, Amount) -> if
	Amount >= 20 -> [{Acc, Bal+Amount} | T];
	true -> [{Acc, Bal} | T]
	end;
deposit([H | T], Acc, Amount) -> [H | deposit(T, Acc, Amount)].

withdraw([], _, _) -> [];
withdraw([{Acc, Bal} | T], Acc, Amount) -> if
	Amount >=1 -> [{Acc, Bal-Amount} | T];
	true -> [{Acc, Bal} | T]
	end;
withdraw([H | T], Acc, Amount) -> [H | withdraw(T, Acc, Amount)].

bank(Lst) ->
	receive
		{Action, Account, Amount} when Action == open ->
			bank(Lst++ [{Account, Amount}]);
		{Action, Account, Amount} when Action == deposit ->
			bank(deposit(Lst, Account, Amount));
		{Action, Account, Amount} when Action == withdraw ->
			bank(withdraw(Lst, Account, Amount));
		print -> io:format("~p~n", [Lst]),
			bank(Lst)
	end.

test04() -> 
	Bank = spawn(hw15, bank, [[]]),
	Bank ! {open, 100, 3000},			% Creates an account with Id = 100 and $3000.
	Bank ! {open, 200, 5000},			% Creates an account with Id = 200 and $5000.
	Bank ! {open, 300, 12000},			% Creates an account with Id = 300 and $12000.
	Bank ! print,						% Prints the balance of all the accounts on screen.
	Bank ! {deposit, 300, 5000},		% Adds $5000 to account with Id = 300.
	Bank ! {deposit, 100, 15},			% Nothing happens since the minimum amount to deposit is $20.
	Bank ! {withdraw, 200, 1500},		% Withdraws $1500 from the account with Id = 200.
	Bank ! {withdraw, 300, 0.50},		% Nothing happens since the minimum amount to withdraw is $1.
	Bank ! print,						% Prints the current balance of all the accounts: [{100,3000},{200,6500},{300,17000}]
	ok.