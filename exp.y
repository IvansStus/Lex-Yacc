/*Ivan Stus 
 /*cssc1943, 821201908
 *CS530, Spring 2020
 *Assignment #3, Grammar Parser
 *exp.y - Yacc Source File
*/

%{
#include <cstdio>
#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
  
using namespace std;
    
extern FILE *yyin;  /*Initialize constant variables used throughout program*/
int yyerror(const char *s);
extern int yylex();
extern int yyparse();
%}

%error-verbose
%union {
    char *sval;
    char *opval;
}

%token <sval>EQUALS <sval>SEMI
%token EOL <opval>OP
%token <sval>ID
%token <sval>INVALID_ID
%token <sval>OPEN_PARENTHESIS <sval>CLOSE_PARENTHESIS END   /*END token specifies end of file, if prompted stop accepting inputs*/
%locations
%%

lines:
line {}
| lines line {}
;

line: EOL {}    
| END {YYACCEPT;}
| assign EOL {cout << "Valid assignment" << endl; }
| exp EOL {cout << "Valid Expression" << endl;}
| error EOL {cout << endl << endl; yyerrok;}
;

assign:
    id equals exp semi {}
;

exp:
id {}
 | id op exp {}
 | openParenthesis id op id closeParenthesis {}
;
id: ID {cout << $1 << " ";};
op: OP {cout << $1 << " ";};
semi: SEMI {cout << $1 << " ";};
equals: EQUALS {cout << $1 << " ";};
openParenthesis: OPEN_PARENTHESIS {cout << $1 << " ";};
closeParenthesis: CLOSE_PARENTHESIS {cout << $1 << " ";};
%%

int main(int argc, char **argv) {   //Executing code
    FILE *file = fopen("ex.txt", "r");    //Opens ex.txt file given via assignment prompt

    // File check
    if (!file) {
        printf("Can't open ex.txt\n");
        return -1;
    }

    // lex reads from file
    yyin = file;

    // parses input
    yyparse();
    return 0;
}