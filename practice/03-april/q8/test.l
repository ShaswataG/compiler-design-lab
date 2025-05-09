/*
Build a DFA to detect repeated words in a sentence (the the cat should be flagged)
*/
%{
#include<stdio.h>
#include<string.h>
char prevWord[20];
int flag = 0;
void stripTrailingWhitespace(char *str) {
    int len = strlen(str);
    while (len > 0 && (str[len - 1] == ' ' || str[len - 1] == '\t' || str[len - 1] == '\n'))
        str[--len] = '\0';
}
%}

%%
[a-zA-Z0-9]+[ \t\n] {
    char currWord[20];
    printf("prevWord: %s\n", prevWord);
    printf("yytext: %s\n", yytext);
    strcpy(currWord, yytext);
    stripTrailingWhitespace(currWord);
    stripTrailingWhitespace(prevWord);
    printf("strlen(currWord): %zu\n", strlen(currWord));
    if (strlen(prevWord) > 0 && strcmp(currWord, prevWord) == 0) {
        printf("%s is a repeated", currWord);
        flag = 1;
    }
    strcpy(prevWord, yytext);

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