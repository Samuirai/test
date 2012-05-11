all : gcc

lex.yy.c : test.lex
		flex $<

gcc : lex.yy.c
		gcc -o test $< -lfl
