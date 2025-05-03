/*
youtube URL: https://youtu.be/FOuGyd28ckw?feature=shared

LEX program to identify the capital words from the given input string.
*/

%{
#include<stdio.h>
%}

%%
[A-Z]+[ \t\n] {printf("%s\n", yytext);}
. ;
%%

int main() {
	printf("Enter a string: ");
	yylex();
	return 0;
}

int yywrap() {
	return 1;
}
