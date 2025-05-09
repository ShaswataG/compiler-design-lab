/*
Design an NFA for the language of all strings where the third last symbol is always 'a' over {a, b}
*/

%{
#include<stdio.h>
int flag = 0;
%}

%%
[ab]*a(a|b)(a|b) {
    // printf("\nyytext: %s\n", yytext);
    flag = 1;
}
\n {
    // printf("\nyytext: %s\n", yytext);
    return 1;
}
[^ab] {
    // printf("\nyytext:%s\n", yytext);
    flag = -1;
    return 0;
}

%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    /* printf("flag = %d", flag); */
    if (flag == 1) {
        printf("\nThird last symbol is a\n");
    } else if (flag == 0) {
        printf("\nThird last symbol is not a\n");
    } else {
        printf("\nInvalid input\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}