%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
int errors = 0; 
%}

%token ARTICLE NOUN VERB PREP EOL

%start input

%%
input: SENTENCE EOL { if (errors == 0) printf("PASS\n"); else printf("FAIL\n"); errors = 0; }
     | SENTENCE EOL input 
     | error EOL { yyerrok; errors++; }
     ;

SENTENCE: NOUN_PHRASE VERB_PHRASE { if (errors == 0) printf("PASS\n"); else printf("FAIL\n"); errors = 0; }
        ;

NOUN_PHRASE: CMPLX_NOUN
           | CMPLX_NOUN PREP_PHRASE
           ;

VERB_PHRASE: VERB
           | VERB NOUN_PHRASE
           ;

PREP_PHRASE: PREP CMPLX_NOUN;

CMPLX_NOUN: ARTICLE NOUN;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Parse error: %s\n", s);
}

int main(int argc, char** argv) {
    FILE* inputFile = fopen(argv[1], "r");
    if (!inputFile) {
        printf("No such file: %s\n", argv[1]);
        return 1;
    }
    yyin = inputFile;
    yyparse();
    fclose(inputFile);
    return 0;
}
