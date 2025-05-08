/*
Flex program to implement positive closure
*/
%{
#include<stdio.h>
int count = 0;
%}

%%

ab {
    count++;
}
. ;
%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    if (count > 0) {
        printf("\nMatched positive closure: found 'ab' %d times\n", count);
    } else {
        printf("\nCouldn't find positive closure\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}