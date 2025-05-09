/*
Construct a DFA that accepts only valid variable names in Python (cannot start with a number, special characters accept _)
*/

%{
#include<stdio.h>
%}

%%
[a-zA-Z]+[0-9a-zA-Z_]* {
    printf("\nValid variable name\n");
}

\n return 1;

. {
    printf("\nInvalid variable name\n");
    return 1;
};

%%

int main() {
    printf("Enter an input string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}