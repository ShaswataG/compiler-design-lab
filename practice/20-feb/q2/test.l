/*
Find whether a letter is vowel or not
*/

%{
#include<stdio.h>
%}

%%
[aeiouAEIOU]([a-zA-Z]*) { 
    printf("\n%s is a vowel word\n", yytext);
    return 1;
}

[^aeiouAEIOU]([a-zA-Z]*) {
    printf("\n%s is not a vowel word\n", yytext);
    return 1;
}
[ \t\n]+ ;
%%

int main() {
    printf("\nEnter a string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}