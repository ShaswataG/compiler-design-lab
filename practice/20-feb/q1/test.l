/*
Given string is a word or number
*/

%{
#include<stdio.h>
int isEntered = 0;
int flag = -1;
%}

%%
\n|[  \t]+ { 
    printf("%s", yytext);
    if (isEntered == 1) return 1;
    flag = -1;
    return 1;
}
[a-zA-Z]+ { isEntered = 1; flag = 0; }
[0-9]+ { 
    isEntered = 1;
    if (flag != 0) {
        flag = 1;
    }
}
%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    if (flag == -1) {
        printf("Invalid input\n");
        return 0;
    }
    printf("Input string is a %s\n", (flag == 0) ? "word" : "digit");
    return 0;
}

int yywrap() {
    return 1;
}