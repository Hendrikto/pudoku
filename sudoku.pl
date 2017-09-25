% cell(value, row, column, block)
cell(e, _, _, _).

% row_contains(row, value)
row_contains(R, V) :-
	cell(V, R, _, _).

% column_contains(column, value)
column_contains(C, V) :-
	cell(V, _, C, _).

% block_contains(block, value)
block_contains(B, V) :-
	cell(V, _, _, B).

% value_allowed(value, row, column, block)
value_allowed(V, R, C, B) :-
	member(V, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
	\+ row_contains(R, V),
	\+ column_contains(C, V),
	\+ block_contains(B, V).

% print_row(row)
print_row(R) :- print_r(R, 0).
print_r(R, 8) :-
	cell(V, R, 8, _),
	write(V),
	nl,
	!.
print_r(R, C) :-
	cell(V, R, C, _),
	write(V),
	Next is C + 1,
	call(print_r(R, Next)).


% print_sudoku()
print_sudoku :- print_s(0).
print_s(8) :-
	print_row(8),
	!.
print_s(R) :-
	print_row(R),
	Next is R + 1,
	print_s(Next).

