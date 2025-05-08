/*
Flex program to implement positive closure

implementing positive closure of a dynamic string instead of hardcoded pattern, doesn't make sense in lex program as instead of regex, its using common logic for finding pattern
*/
%{
#include <stdio.h>
#include <string.h>

char pattern[100];
char input[1000];
int matchFound = 0;

// Function to check for positive closure
int is_positive_closure_present(const char *input, const char *pattern) {
    int len_p = strlen(pattern);
    int len_i = strlen(input);

    for (int i = 0; i <= len_i - len_p; i++) {
        int j = 0;
        while (i + j < len_i &&
               input[i + j] == pattern[j % len_p]) {
            j++;
            if (j % len_p == 0 && j != 0 && j / len_p >= 1) {
                // Check if it's at least one full repetition
                matchFound = 1;
                return 1;
            }
        }
    }
    return 0;
}
%}

%%

.*\n {
    strcpy(input, yytext);
    is_positive_closure_present(input, pattern);
    return 0;
}

%%

int main() {
    printf("Enter pattern: ");
    scanf("%s", pattern);

    printf("Enter input string: ");
    yylex();

    if (matchFound) {
        printf("\nMatched positive closure of pattern \"%s\" in input string.\n", pattern);
    } else {
        printf("\nCouldn't match positive closure.\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}
