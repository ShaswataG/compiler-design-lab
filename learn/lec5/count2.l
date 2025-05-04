/*
youtube url: https://youtu.be/_z7AN4vdGpY?feature=shared

LEX Program to count number of lines, words, spaces and characters in a given statement
*/

%{
#include<stdio.h>
int lc = 0, wc = 0, sc = 0, cc = 0;
%}

%%
[\n] { lc++; cc+=yyleng; }
[ \t] { sc++; cc+=yyleng; }
[^\t\n ]+ { 
wc++;
cc+=yyleng;
}
%%

int main() {
	printf("\nEnter an input string: ");
	yylex();
	printf("\nNumber of lines = %d\n", lc);
	printf("\nNumber of words = %d\n", wc);
	printf("\nNumber of spaces = %d\n", sc);
	printf("\nNumber of characters = %d\n", cc);
	return 0;
}

int yywrap() {
	return 1;
}
