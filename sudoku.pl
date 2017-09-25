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
	\+ row_contains(R, V),
	\+ column_contains(C, V),
	\+ block_contains(B, V).

% print_row(row, column)
print_row(R, 8) :-
	cell(V, R, 8, _),
	write(V),
	nl.
print_row(R, C) :-
	cell(V, R, C, _),
	write(V),
	Next is C + 1,
	call(print_row(R, Next)).


% print_sudoku()
print_sudoku :- print_s(0).
print_s(8) :-
	print_row(8, 0).
print_s(R) :-
	print_row(R, 0),
	Next is R + 1,
	print_s(Next).

