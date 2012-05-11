%{

void yyerror(char* msg);
#include <stdio.h>
int line=1;
extern FILE *yyin;
%}

%union
{
    float floater;
    int integer;
}

%start S

%token ERROR
%token OPA CPA OBR CBR
%token INC_OP DEC_OP NOT
%token TIMES DIVIDE MOD
%token PLUS MINUS
%token SMALLER LESS_OR_EQUAL LARGER GREATER_OR_EQUAL
%token EQUAL NOT_EQUAL
%token LOG_AND
%token LOG_OR
%token SINGLE_EQUAL
%token COMMA
%token IDENTIFIER CONSTANTINT CONSTANTFLOAT WHILE ELSE DO SEMICOLON INT VOID FLOAT RETURN IF AUS

%left OPA CPA OBR CBR
%right INC_OP DEC_OP NOT
%right UPLUS UMINUS
%left PLUS MINUS 
%left TIMES DIVIDE MOD 
%left SMALLER LESS_OR_EQUAL LARGER GREATER_OR_EQUAL EQUAL NOT_EQUAL LOG_AND LOG_OR
%right SINGLE_EQUAL COMMA

%%    // grammar rules

S : programm AUS

programm
    : function                  
    | programm function         
    ;


function
    : var_type id OPA parameter_list CPA SEMICOLON
    | var_type id OPA parameter_list CPA function_body
    ;

function_body
    : OBR statement_list  CBR
    | OBR declaration_list statement_list CBR
    ;

declaration_list
    : declaration SEMICOLON
    | declaration_list declaration SEMICOLON
    ;

declaration
    : INT id 
    | FLOAT id 
    | declaration COMMA id 
    ;

parameter_list
    : INT id 
    | FLOAT id
    | parameter_list COMMA INT id
    | parameter_list COMMA FLOAT id
    | VOID                     
    |                          
    ;

var_type
    : INT 
    | VOID
    | FLOAT
    ;

statement_list
    : statement
    | statement_list statement  
    ;

statement
    : matched_statement
    | unmatched_statement
    ;

matched_statement
    : IF OPA assignment CPA matched_statement ELSE matched_statement
    | assignment SEMICOLON                                                
    | RETURN SEMICOLON                                                 
    | RETURN assignment SEMICOLON                                                  
    | WHILE OPA assignment CPA matched_statement                             
    | DO statement WHILE OPA assignment CPA SEMICOLON                              
    | OBR statement_list CBR                                                 
    | OBR CBR                                                                                                                                                                                       
    ;

unmatched_statement
    : IF OPA assignment CPA statement                       
    | WHILE OPA assignment CPA unmatched_statement          
    | IF OPA assignment CPA matched_statement ELSE unmatched_statement 
    ;


assignment
    : expression                 
    | id SINGLE_EQUAL expression 
    ;

expression
    : INC_OP expression                        
    | DEC_OP expression                        
    | expression LOG_OR           expression   
    | expression LOG_AND          expression   
    | expression NOT_EQUAL        expression   
    | expression EQUAL            expression   
    | expression GREATER_OR_EQUAL expression   
    | expression LESS_OR_EQUAL    expression   
    | expression LARGER           expression   
    | expression SMALLER          expression      
    | expression PLUS             expression   
    | expression MINUS            expression   
    | expression TIMES            expression   
    | expression DIVIDE           expression   
    | expression MOD              expression   
    | NOT expression                           
    | PLUS expression      %prec UPLUS              
    | MINUS expression     %prec UMINUS        
    | CONSTANTINT
    | CONSTANTFLOAT
    | OPA expression CPA                       
    | id OPA exp_list CPA                      
    | id OPA CPA                              
    | id
    ;

exp_list
    : expression
    | exp_list COMMA expression	
    ;

id
    : IDENTIFIER 
    ;
    
%%

void showhelp(){
    printf("\033[34m>>\033[0m This is a basic C Parser created by Fabian F.\n");
    printf("\033[34m>>\033[0m in May 2012... It should validate a C-File.\n");
    printf("\033[34m>>\033[0m usage:\n");
    printf("\033[34m>>\033[0m   ./c-parser [<file>|-h]\n");
    printf("\033[34m>>\033[0m     -h,--help  prints this help text \n");
    printf("\033[34m>>\033[0m     <file>     path to a C file\n");
    printf("\033[34m>>\033[0m example:\n");
    printf("\033[34m>>\033[0m   ./c-parser input.c\n");
}

int main(int argc, char **argv){
    
    
    if(argc!=2 || (argc==2 && (!strcmp(argv[1],"-h") || !strcmp(argv[1],"--help")))){
        showhelp();
        return 0;
    }
    printf("\033[34m>>\033[0m starting the C Parser\n");
    FILE *myfile = fopen(argv[1], "r");
    // make sure it is valid:
    if (!myfile) {
        printf("\033[34m>>\033[0m I can't open %s\033[0m\n",argv[1]);
        return -1;
    }
	yyin = myfile;
	int ret;
	if(!yyparse())
	    printf("\033[34m>>\033[0m \033[32mParser war erfolgreich\033[0m\n");
	else
	    printf("\033[34m>>\033[0m \033[31mParser war nicht erfolgreich\033[0m\n");
	return 0;
}

void yyerror(char*msg){
	printf("\033[34m>>\033[0m \033[31mError\033[0m in line \033[31m%d\033[0m: \033[33m%s\033[0m\n", line,msg);
}