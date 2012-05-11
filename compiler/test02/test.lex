%{
#include "y.tab.h"
%}
%%
\+ {
    return PLUS;}
-  {
    return MINUS;}
\* {
    return MAL;}
\/  {
    return DURCH;}
0  {
    return NU;}
1  {
    return EINS;}
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
