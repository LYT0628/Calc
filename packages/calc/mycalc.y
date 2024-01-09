%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUF 1
%}

// 定义 词法单元 的结构 
%union {
	int int_value;
	double double_value;
}

// 定义词法单元类型
%token <double_value> DOUBLE_LITERAL
%token ADD SUB MUL DIV CR
%type <double_value> expression term primary_expression
%token OP CP 
%%

line_list
	: line
	| line_list line
	;
line
	: expression CR
	{
		printf(">>%lf\n", $1);
	}
	;
expression
	: term
	| expression ADD term
	{
		$$ = $1 + $3;
	}
	| expression SUB term
	{
		$$ = $1 - $3;
	}

	;
term
	: primary_expression
	| term MUL primary_expression
	{
		$$ = $1 * $3; 
	}
	| term DIV primary_expression
	{
		$$ = $1 / $3;
	}
	;
primary_expression
	: DOUBLE_LITERAL
	| OP expression CP 
	{
		$$ = $2;
	}

	;

%%

int yyerror(char const *str)
{
	extern char *yytext;
	fprintf(stderr, "parser error near %s\n", yytext);
}

int main(void)
{
	extern int yyparse(void);
	extern FILE *yyin;
	
	yyin = stdin;
	if(yyparse()){
		fprintf(stderr, "Error ! Error ! Error! \n");
	} 
}
