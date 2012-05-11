%{
#include <math.h>
#include <stdio.h>
void yyerror(char *message);
%}

%union
{
    float floater;
    int integer;
}

%start S

%token AUS
%token MAL DURCH
%token PLUS MINUS
%token AUF ZU
%token INT FLOAT
%token POW SQRT

%left MAL DURCH
%left PLUS MINUS

%type <floater> E
%type <floater> FLOAT
%type <integer> INT

%%

S : E AUS {printf("= %f\n ",$1);}
| S E AUS {printf("= %f\n ",$2);};

E : INT {$$ = $1;}
| FLOAT {$$ = $1;}
| E PLUS E {$$ = $1 + $3;}
| E MINUS E {$$ = $1 - $3;}
| E MAL E {$$ = $1 * $3;}
| E DURCH E {$$ = $1 / $3;}
| AUF E ZU {$$ = $2;}
| E POW E {$$ = pow($1,$3);}
| SQRT AUF E ZU {$$ = sqrt($3);}
| MINUS E {$$ = -$2;};

%%

int main(int argc, char **argv) {
    yyparse();
    return 0;
}

void yyerror(char *message) {
    printf("Good Bye");
}
