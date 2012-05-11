%{
#include <math.h>
#include <stdio.h>
void yyerror(char *message);
%}

%start S

%token AUS
%token PLUS MINUS
%token MAL DURCH
%token NU EINS
%token AUF ZU

%left PLUS MINUS
%left MAL DURCH

%%

S : E AUS {printf("= %d\n ",$1);}
| S E AUS {printf("= %d\n ",$2);};

E : B {$$ = $1;}
| E PLUS E {$$ = $1 + $3;}
| E MINUS E {$$ = $1 - $3;}
| E MAL E {$$ = $1 * $3;}
| E DURCH E {$$ = $1 / $3;}
| AUF E ZU {$$ = $2;}
| MINUS E {$$ = -$2;};

B : NU {$$ = 0;}
| EINS {$$ = 1;}
| B NU {$$ = $1 * 2;}
| B EINS {$$ = $1 * 2 + 1};

%%

int main(int argc, char **argv) {
    yyparse();
    return 0;
}

void yyerror(char *message) {
    printf("Good Bye");
}
