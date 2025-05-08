/*
Design DFA that accept all strings end with 00 over Σ = {0, 1}

RE: (0|1)*00, minimum length of the string = 2 and states = 3

Implement the above c/python/java code using lex syntax
*/

%{
#include<stdio.h>
#include<string.h>
int found = 0;
%}

%%
[0|1]*00 {
    found = 1;
}

[ \t\n] {
    return 1;
}

. {
    if (found == 1) {
        found = 0;
    }
    return 1;
}
%%

int main() {
    printf("Enter an input string: ");
    yylex();
    if (found == 1) {
        printf("\nString ends with '00'\n");
    } else {
        printf("\nString doesn't end with '00'\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}