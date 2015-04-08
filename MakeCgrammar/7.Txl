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
	[repeat variable_declaration_hasConst] [return_statement]
	| [repeat scan_statement] [return_statement];
	| [print_statement] [return_statement]
end define

define return_type
	int
end define

define variable_declaration_hasConst
	'const [variable_declaration]
	|[variable_declaration]
end define

define variable_declaration
	[var_type] [repeat start_variable_declaration] [variable_declared]
	|[var_type] [repeat start_variable_declaration] [end_variable_declaration]
	|[var_type] [id] [variable_declared]
	|[var_type] [op] [id] [variable_declared]
	|[id] [variable_declared]
	|[var_type] [end_variable_declaration]
end define

define start_variable_declaration
	[id],
end define

define end_variable_declaration
	[id]; [NL]
end define

define variable_declared
	= [variable]; [NL]
	|= [variable] [op] [id]; [NL]
	|= [id] [op] [variable]; [NL]
end define

define variable
	[number]
	|[stringlit]
	|[charlit] 
end define
	
define var_type
	'char
	|'unsigned char
	|'signed char
	|'int
	|'unsigned int
	|'signed int
	|'short
	|'unsigned short
	|'long
	|'unsigned long
	|'float
	|'double
	|'long double
end define

define op
    '+ | '- | '/ | '* | '%
end define

define print_statement
	printf([stringlit]); [NL]
end define

define scan_statement
	scanf([stringlit]); [NL]
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