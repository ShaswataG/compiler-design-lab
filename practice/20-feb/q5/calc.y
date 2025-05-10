%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

input:
    
    | input line
    ;

line:
    expr '\n'
    ;

expr:
    expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { 
        if ($3 == 0) {
            printf("\nDivision by zero error\n");
            exit(1);
        }
        $$ = $1 / $3;
    }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'{ $$ = $2; }
    | NUMBER { $$ = $1; }
%%

int main() {
    printf("Enter expression: \n");
    return yyparser();
}