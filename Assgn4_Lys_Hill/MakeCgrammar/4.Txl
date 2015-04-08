% Grammar:
define program
	[c_function]
end define

define c_function
	[function_head] [NL]
	{ [NL][IN]
	  [function_body]
	}
end define

define function_head
	[return_type] [function_name]()
end define

define function_name
	[id]
end define

define function_body
	[repeat variable_declaration] [return_statement]
	| [print_statement] [return_statement]
end define

define return_type
	int
end define

define variable_declaration
	[id] [id][variable_declared] 
	| [id] [repeat start_variable_declaration] [end_variable_declaration][variable_declared] 
	| [id] [id] [id][variable_declared] 
end define

define start_variable_declaration
	[id],
end define

define end_variable_declaration
	[id]; 
end define

define variable_declared
	; [NL]
	|= [number]; [NL]
	|= [stringlit]; [NL]
	|= [charlit]; [NL]
end define

define print_statement
	printf([stringlit]); [NL]
end define

define return_statement
	return [return_value]; [NL][EX]
end define

define return_value
	[number]
end define

% Rules:
function main
    match [program]
	P[program]
end function