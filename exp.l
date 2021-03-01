/*Ivan Stus 
 /*cssc1943, 821201908
 *CS530, Spring 2020
 *Assignment #3, Grammar Parser
 *exp.l - Lex Source File
*/

%{
#include "exp.tab.h"
#include <iostream>
#include <cstdio>

using namespace std;

extern FILE* yyin;
extern int yyparse();
%}
%option noyywrap
%option yylineno
%%
"=" { yylval.opval = strdup(yytext); return EQUALS; }
";" { yylval.opval = strdup(yytext); return SEMI; }
"+" { yylval.opval = strdup(yytext); return OP; }
"-" { yylval.opval = strdup(yytext); return OP; }
"*" { yylval.opval = strdup(yytext); return OP; }
"/" { yylval.opval = strdup(yytext); return OP; }
"%" { yylval.opval = strdup(yytext); return OP; }
"(" { yylval.opval = strdup(yytext); return OPEN_PARENTHESIS; }
")" { yylval.opval = strdup(yytext); return CLOSE_PARENTHESIS; }
[a-zA-Z][a-zA-Z0-9]* { yylval.sval = strdup(yytext); return ID; }
[ \t\r] { /* ignores whitespace */ }
"\n" { return EOL;}
<<EOF>> {return END;}
. {yylval.opval = strdup(yytext); return INVALID_ID;}
%%
int yyerror(const char *s)
{
    fprintf(stderr, "Line: %d | Error: %s\n", yylineno,s);
    return 1;
}