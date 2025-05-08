/*
Construct a finite automation for email validation (a simplified version with rules like letters@domain.com)
*/
%{
#include<stdio.h>
int flag = 0;
%}

%%
[a-z0-9]+@[a-z]+\.(com|in) { flag = 1; }
[ \t] { 
    if (flag == 1) {
        flag = 0;
    }
    return 1;
}
. { return 1; }
%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    if (flag == 1) {
        printf("\nEmail is valid\n");
    } else {
        printf("\nEmail is invalid\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}