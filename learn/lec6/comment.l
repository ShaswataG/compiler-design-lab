/*
youtube url: https://youtu.be/_YJB2Yv3OlQ?feature=shared

LEX program to count the number of comment lines in a given C program
*/
%{
#include<stdio.h>
int nc = 0;
%}

%%
"//"[a-zA-Z0-9 \t]*"\n" { nc++; }
"/*"[a-zA-Z0-9 \t\n]*"*/" { nc++; }
%%

int main(int argc, char* argv[]) {

	if (argc == 2) {
		yyin = fopen(argv[1], "r");
	} else {
		printf("\nEnter an input: ");
		yyin = stdin;	
	}
	yylex();
	printf("Number of comment lines = %d", nc);
	return 0;
}

int yywrap() {
	return 1;
}
