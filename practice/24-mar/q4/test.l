%{
#include<stdio.h>
int flag = 0;
%}

%%
[ \t\n]*if[ \t\n]* | 
[ \t\n]*else[ \t\n]* | 
[ \t\n]*while[ \t\n]* | 
[ \t\n]*return[ \t\n]* {
    if (flag == 0) flag++;
    char keyword[10];
    sscanf(yytext, "%s", keyword);
    printf("\n%s is a keyword\n", keyword);
}
\n return 1;
. ;
%%

int main() {
    printf("\nEnter an input string: ");
    yylex();
    if (flag == 0) {
        printf("\nCouldn't find any keyword\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}