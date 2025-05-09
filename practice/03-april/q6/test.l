/*
Create a DFA that validates HTML tags (e.g.: <html>, <body>, but rejects <123>)
*/

%{
#include<stdio.h>
%}

%%
\<(html|body)\>    { printf("Valid HTML tag\n"); }
\n { return 1; }
.                 { printf("Invalid HTML tag\n"); return 1; }
%%

int main() {
    printf("Enter an input string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}