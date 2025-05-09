/*
Design an NFA that accepts strings containing either '101' or '110' as a sub-string
*/
%{
#include<stdio.h>
int flag = 0;
%}

%%
[01]*(101|110)[01]* {
    flag = 1;
}

\n { return 1; }

[^01] {
    flag = -1;
    return 1;
}
%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    if (flag == -1) {
        printf("\nInvalid input\n");
    } else if (flag == 1) {
        printf("\nInput string contains either '101' or '110' as a sub-string\n");
    } else {
        printf("\nInput string contains neither '101' nor '110' as a sub-string\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}