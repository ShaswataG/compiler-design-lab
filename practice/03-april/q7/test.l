/*
Design a DFA that classifies text as a question or statement, accepting sentences ending in ? or .
*/

%{
#include<stdio.h>
%}

%%
[a-zA-Z0-9 ]+\? {
    printf("\nIt is a question\n");
    return 1;
}
[a-zA-Z0-9 ]+\. {
    printf("\nIt is a statement\n");
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