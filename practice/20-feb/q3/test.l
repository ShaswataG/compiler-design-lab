%{
#include<stdio.h>
#include<string.h>
#define MAX_STACK 100
char stack[MAX_STACK];
int top = -1;

int checkBracket(char currBracket) {
    if (stack[top] == '(' && currBracket == ')') {
        return 1;
    } else if (stack[top] == '{' && currBracket == '}') {
        return 1;
    } else if (stack[top] == '[' && currBracket == ']') {
        return 1;
    } else {
        return 0;
    }
}
%}


%%
[({\[] {
    stack[++top] = yytext[0];
}
[)}\]] {
    if (top >= 0 && checkBracket(yytext[0]) == 1) {
        top--;
    } else {
        printf("\nInvalid parenthesis\n");
        return 1;
    }
}
. ;
%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    if (top == -1) {
        printf("\nValid parenthesis\n");
    } else {
        printf("\nInvalid parenthesis\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}