%{
#include "y.tab.h"
%}
%%
\+ {
    return PLUS;}
\*\* {
    return POW;}
sqrt {
    return SQRT;}
-  {
    return MINUS;}
\* {
    return MAL;}
\/  {
    return DURCH;}
[0-9]+  {
    yylval.integer = atoi(yytext); return INT;}
[0-9]+\.[0-9]+  {
    yylval.floater = atof(yytext); return FLOAT;}
\( {
    return AUF;}
\) {
    return ZU;}
\n {
    return AUS;}
[ ]+  ;
. {
   printf("what?"); }

%%