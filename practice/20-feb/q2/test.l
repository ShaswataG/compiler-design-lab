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

[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]([a-zA-Z]*) {
    printf("\n%s is not a vowel word\n", yytext);
    return 1;
}
[ \t\n]+ ;

. { printf("\nUnknown character: %s\n", yytext); return 1;}

%%

int main() {
    printf("\nEnter a string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}