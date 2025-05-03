/*
youtube URL: https://youtu.be/WsEUoO6XE1k?feature=shared

Lex Program to recognise and display keywords, numbers and words in a given statement
*/

%{
#include<stdio.h>
%}

%%
if |
else |
switch |
for |
while |
do |
int |
printf |
break |
continue |
scanf {printf("\n%s is a keyword", yytext);}
[0-9]+ {printf("\n%s is a number", yytext);}
[A-Za-z]+ {printf("\n%s is a word", yytext);}
. | \n {ECHO;}
%%

int main()
{
	printf("\nEnter a string: ");
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}
