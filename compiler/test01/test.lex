%{
int zeile = 0;
%}
%%
.*\n printf("%4d\t%s", ++zeile, yytext);
%%
