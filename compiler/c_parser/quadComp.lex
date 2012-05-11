%{
#include "y.tab.h"
extern line;
%}
%%


"while" {  return WHILE;}
"if" {  return IF;}
"else" { return ELSE;}
"do" { return DO;}
"return" {  return RETURN;}
";" { return SEMICOLON;}
"#ENDOFFILE#" { return AUS;}

"int" { return INT;}
"void" { return VOID;}
"float" { return FLOAT;}

"++" { return INC_OP;}
"--" { return DEC_OP;}
"||" { return LOG_OR;}
"&&" { return LOG_AND;}
"!=" { return NOT_EQUAL;}
"==" { return EQUAL;}
"=" { return SINGLE_EQUAL;}
">=" { return GREATER_OR_EQUAL;}
"<=" { return LESS_OR_EQUAL;}
">" { return LARGER;}
"<" { return SMALLER;}
"+" { return PLUS;}
"-" { return MINUS;}
"*" { return TIMES;}
"%" { return MOD;}
"/" { return DIVIDE;}
"!" { return NOT;}
"(" { return OPA;}
")" { return CPA;}
"{" { return OBR;}
"}" { return CBR;}
"," { return COMMA;}
[a-zA-Z][a-zA-Z0-9_]* { return IDENTIFIER;}
[0-9]+ {
  yylval.integer = atoi(yytext); return CONSTANTINT;}
[0-9]+\.[0-9]+ { yylval.floater = atof(yytext); return CONSTANTFLOAT;}
  
[ \t\r]+ ;
[\n] {line+=1;}

. {
  printf("\033[34m>>\033[0m \033[31mWarning\033[0m found undefined character: \033[33m%s\033[0m\n",yytext);
  return ERROR;
  }

%%