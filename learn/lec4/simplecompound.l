/*
youtube URL: https://youtu.be/5G4ufsTR-_0?feature=shared

Program to recognize whether a statement is simple or compound
*/
%{
#include<stdio.h>
int flag = 0;
%}

%%

([ \t]|^)and($|[ \t\n]) |
([ \t]|^)or($|[ \t\n]) |
([ \t]|^)but($|[ \t\n]) |
([ \t]|^)because($|[ \t\n]) |
([ \t]|^)if($|[ \t\n]) |
([ \t]|^)then($|[ \t\n]) |
([ \t]|^)nevertheleess($|[ \t\n]) { flag = 1; }
. ;
\n { return 0; }
%%

int main() {
	printf("\nEnter an input string: ");
	yylex();
	printf("\nThe given sentence is %s\n", (flag == 0) ? "simple" : "compound");
	return 0;
}

int yywrap() {
	return 1;
}
