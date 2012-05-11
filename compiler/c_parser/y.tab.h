/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ERROR = 258,
     OPA = 259,
     CPA = 260,
     OBR = 261,
     CBR = 262,
     INC_OP = 263,
     DEC_OP = 264,
     NOT = 265,
     TIMES = 266,
     DIVIDE = 267,
     MOD = 268,
     PLUS = 269,
     MINUS = 270,
     SMALLER = 271,
     LESS_OR_EQUAL = 272,
     LARGER = 273,
     GREATER_OR_EQUAL = 274,
     EQUAL = 275,
     NOT_EQUAL = 276,
     LOG_AND = 277,
     LOG_OR = 278,
     SINGLE_EQUAL = 279,
     COMMA = 280,
     IDENTIFIER = 281,
     CONSTANTINT = 282,
     CONSTANTFLOAT = 283,
     WHILE = 284,
     ELSE = 285,
     DO = 286,
     SEMICOLON = 287,
     INT = 288,
     VOID = 289,
     FLOAT = 290,
     RETURN = 291,
     IF = 292,
     AUS = 293,
     UMINUS = 294,
     UPLUS = 295
   };
#endif
/* Tokens.  */
#define ERROR 258
#define OPA 259
#define CPA 260
#define OBR 261
#define CBR 262
#define INC_OP 263
#define DEC_OP 264
#define NOT 265
#define TIMES 266
#define DIVIDE 267
#define MOD 268
#define PLUS 269
#define MINUS 270
#define SMALLER 271
#define LESS_OR_EQUAL 272
#define LARGER 273
#define GREATER_OR_EQUAL 274
#define EQUAL 275
#define NOT_EQUAL 276
#define LOG_AND 277
#define LOG_OR 278
#define SINGLE_EQUAL 279
#define COMMA 280
#define IDENTIFIER 281
#define CONSTANTINT 282
#define CONSTANTFLOAT 283
#define WHILE 284
#define ELSE 285
#define DO 286
#define SEMICOLON 287
#define INT 288
#define VOID 289
#define FLOAT 290
#define RETURN 291
#define IF 292
#define AUS 293
#define UMINUS 294
#define UPLUS 295




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 10 "quadComp.y"
{
    float floater;
    int integer;
}
/* Line 1529 of yacc.c.  */
#line 134 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

