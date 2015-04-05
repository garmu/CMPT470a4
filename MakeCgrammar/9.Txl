% Grammar:
tokens
	id	| "[&]\i*"
end tokens

compounds
    '!= '>= '<= '==
end compounds  

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
	[repeat statement] [return_statement]
end define

define statement
	[variable_declaration]
	|[scan_statement]
	|[print_statement]
	|[if_statement]
end define

define variable_declaration
	[opt 'const] [var_type] [repeat start_variable_name] [variable_assigned]
	|[opt 'const] [var_type] [repeat start_variable_name] [end_variable_name]
	|[opt 'const] [var_type] [id] [variable_assigned]
	|[opt 'const] [id] [variable_assigned]
	|[opt 'const] [var_type] [end_variable_name]
end define

define start_variable_name
	[id],
end define

define end_variable_name
	[id]; [NL]
end define

define variable_assigned
	= [variable]; [NL]
	|= [variable] [op] [id]; [NL]
	|= [id] [op] [variable]; [NL]
end define

define print_statement
	'printf ([stringlit]); [NL]
	| 'printf ([stringlit],[id]); [NL]
end define

define scan_statement
	'scanf ([stringlit],[id]); [NL]
end define

define if_statement
	if([id][conditionOp][variable]){ [NL][IN]
		[repeat statement]
	}[NL]
	|if([id][conditionOp][variable])	[NL][IN]
		[statement]
end define

define return_statement
	return [return_value]; [NL][EX]
end define

define return_value
	[number]
end define

define return_type
	int
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

define conditionOp
    '> | '< | '>= | '<= | '== | '!=
end define    

% Rules:
function main
    match [program]
	P[program]
end function