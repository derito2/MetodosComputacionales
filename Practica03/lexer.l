%{
#include "y.tab.h"
extern int yylval;
%}

%%
"a"         { return ARTICLE; }
"the"       { return ARTICLE; }
"boy"       { return NOUN; }
"girl"      { return NOUN; }
"flower"    { return NOUN; }
"touches"   { return VERB; }
"likes"     { return VERB; }
"sees"      { return VERB; }
"with"      { return PREP; }
\n          { return EOL; }
[ \t]+      { /* ignore whitespace */ }
.           { /* ignore other characters */ }
%%

int yywrap() {
    return 1;
}
