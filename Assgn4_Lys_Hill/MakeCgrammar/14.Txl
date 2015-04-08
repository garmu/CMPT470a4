% Grammar:
tokens
	id				| "[&]\i*" | "\u\i*[+][+]" | "\u\i*[-][-]"
	casechar 		"'\a*'[:]"
	defaultchar		"\a*[:]"
end tokens

compounds
    '!= '>= '<= '== '|| '&& '!( '++
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
	|[else_statement]
	|[switch_statement]
	|[for_statement]
end define




define variable_declaration
	[opt 'const] [var_type] [repeat start_variable_name] [value_assigned]
	|[opt 'const] [var_type] [repeat start_variable_name] [end_variable_name]
	|[opt 'const] [var_type] [id] [value_assigned]
	|[opt 'const] [id] [value_assigned]
	|[opt 'const] [var_type] [end_variable_name]
end define

define start_variable_name
	[id],
end define

define end_variable_name
	[id]; 								[NL]
end define

define value_assigned
	= [value];	 						[NL]
	|= [value] [op] [id]; 				[NL]
	|= [id] [op] [value];	 			[NL]
end define



define print_statement
	'printf ([stringlit]); 				[NL]
	| 'printf ([stringlit],[id]); 		[NL]
end define



define scan_statement
	'scanf ([stringlit],[id]); 			[NL]
end define



define if_statement
	if([if_conditional][extra_if]){ 	[NL][IN]
		[repeat statement]				[EX]
	}									[NL]
	|if([if_conditional][extra_if])	[NL][IN]
		[statement]						[EX]
end define

define if_conditional
	([id][conditionOp][value])
	|[id][conditionOp][value]
	|!([id][conditionOp][value])
end define

define extra_if
	[and_or][if_conditional]
end define





define else_statement
	else { 								[NL][IN]
		[repeat statement]				[EX]
	}									[NL]
	| else								[NL][IN]
		[statement]						[EX]
end define


define switch_statement
	switch([id]){						[NL][IN]
	[repeat case]						
	[default]							[EX]
	}									[NL]
end define

define case
	case [casechar]						[NL][IN]
	[repeat statement]
	break;								[EX][NL]
end define
	
define default
	[defaultchar]						[IN][NL]
	[repeat statement]					[EX]
end define

define for_statement
	for([id]=[value];[if_conditional];[id]){ 				[NL][IN]
		[repeat statement]										[EX]
	}															[NL]
	|for([id]=[value];[if_conditional];[id])				[NL][IN]
		[statement]												[EX]
end define



define return_statement
	return [return_value]; 				[NL][EX]
end define

define return_value
	[number]
end define

define return_type
	int
end define




define value
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

define and_or
	'&&	| '||
end define


% Rules:
function main
    match [program]
	P[program]
end function