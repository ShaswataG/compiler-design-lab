/*
Design a DFA that recognizes palindromic words (eg.: madam, level, deed, naman, malayalam)
*/
%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-zA-Z]+ {
    int left = 0;
    int right = strlen(yytext)-1;
    while (left < right) {
        if (yytext[left] != yytext[right]) {
            printf("\nNot a palindrome\n");
            return 1;
        }
        left++;
        right--;
    }
    printf("\nIts a palindrome\n");
    return 1;
}

\n return 1;

. return 1;

%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}