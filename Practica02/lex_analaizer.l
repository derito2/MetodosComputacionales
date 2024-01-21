%{
#include <stdio.h>
%}

%%

"//".*                     { printf("COMMENT\n"); }
"float"[\t]+[a-zA-Z_]+     { printf("floatdcl id\n"); }
"int"[\t]+[a-zA-Z_]+       { printf("intdcl id\n"); }
[a-zA-Z_]+[\t]*=[\t]*[0-9]+   { printf("id assign inum\n"); }
[a-zA-Z_]+[\t]*=[\t]*[a-zA-Z_]+[\t]*\+[\t]*[0-9]+\.[0-9]+ { printf("id assign id plus fnum\n"); }
"print"[\t]+[a-zA-Z_]+     { printf("print id\n"); }

%%

int main(int argc, char **argv)
{
    yylex();
    return 0;
}
