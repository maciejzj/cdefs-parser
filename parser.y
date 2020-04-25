%{
	#include <stdio.h>

	int yylex();
	void yyerror(const char* s);
%}

%token IDENTIFIER
%token TYPEDEF EXTERN STATIC AUTO REGISTER INLINE RESTRICT
%token CHAR SHORT INT LONG SIGNED UNSIGNED FLOAT DOUBLE CONST VOLATILE VOID
%token STRUCT UNION ENUM ELLIPSIS

%start line

%%

line
	: line declaration
	|
	;

declaration
	: variable_declaration
	;

variable_declaration
	: type_specifier IDENTIFIER ';'
	;

type_specifier
	: VOID
	| CHAR
	| SHORT
	| INT
	| LONG
	| FLOAT
	| DOUBLE
	| SIGNED
	| UNSIGNED
	;

%%

void yyerror(const char *s)
{
	fprintf(stderr, "%s\n", s);
}

int main(void)
{
	yyparse();
	return 0;
}
