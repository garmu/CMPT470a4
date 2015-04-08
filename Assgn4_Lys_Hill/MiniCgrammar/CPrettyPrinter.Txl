% Grammar:
tokens
	id				| "[&]\i*" 
	casechar 		"'\a*'[:]"
	defaultchar		"\a*[:]"
	incr 			"\u\i*[ ]*[+][+]"
	decr			"\u\i*[ ]*[-][-]"
	incl			"\#include<\u+.\u+>"
end tokens

compounds
    '!= '>= '<= '== '|| '&& '!( '++
end compounds  

comments
	//
	/* */
end comments

define program
	[c_function]
end define

define c_function
	[repeat include_statement]
	[function_head] [NL]
	{ [NL][IN]
	  [function_body]
	}
end define

define include_statement
	[incl]					[NL][NL]
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
	|[while_statement]
	|[incrOrDecr_statement]
	|[doWhile_statement]
	| break; [NL]
	| continue; [NL]
end define

define type_cast
	([var_type])
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
	= [opt type_cast][value];	 										[NL]
	|= [opt type_cast][value] [op] [opt type_cast][id]; 				[NL]
	|= [opt type_cast][id] [op] [opt type_cast][value];	 				[NL]
	|= [opt type_cast][id] [op] [opt type_cast][id];	 			    [NL]
end define



define print_statement
	'printf ([stringlit]); 				[NL]
	| 'printf ([stringlit],[id]); 		[NL]
end define



define scan_statement
	'scanf ([stringlit],[id] [opt extra_scan]); [NL]
end define

define extra_scan
	,[id]
end define

define if_statement
	if([conditional][opt extra_cond]){ 	[NL][IN]
		[repeat statement]				[EX]
	}									[NL]
	|if([conditional][opt extra_cond])	[NL][IN]
		[statement]						[EX]
end define

define conditional
	([idOrValue][conditionOp][idOrValue])
	|[idOrValue][conditionOp][idOrValue]
	|!([idOrValue][conditionOp][idOrValue])

end define

define extra_cond
	[and_or][conditional]
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
	'case [casechar]						[NL][IN]
	[repeat statement]
	break;								[EX][NL]
end define
	
define default
	[defaultchar]						[IN][NL]
	[repeat statement]					[EX]
end define

define for_statement
	for([id]=[idOrValue];[conditional];[opt incrOrDecr]){ 			[NL][IN]
		[repeat statement]										[EX]
	}															[NL]
	|for([id]=[idOrValue];[conditional];[opt incrOrDecr])			[NL][IN]
		[statement]												[EX]
end define

define while_statement
	while([conditional][opt extra_cond]){ 	[NL][IN]
		[repeat statement]					[EX]
	}										[NL]
	| while([conditional][opt extra_cond])	[NL][IN]
		[statement]							[EX]
end define

define incrOrDecr_statement
	[incrOrDecr];							[NL]
end define

define doWhile_statement
	do { 									[NL][IN]
		[repeat statement]					[EX]
	} while([conditional][opt extra_cond]);	[NL]
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

define idOrValue
	[value]
	|[id]
	|[value][op][value]
	|[id][op][value]
	|[value][op][id]
	|[id][op][id]
end define

define incrOrDecr
	[incr]
	|[decr]
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