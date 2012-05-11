all : gcc

gcc : lex.yy.c
	    flex test.lex
	    bison -d -b y test.y
		gcc -o test y.tab.c $< -lfl
