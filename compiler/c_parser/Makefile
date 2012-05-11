all :   
		flex quadComp.lex
	    bison -d -b y quadComp.y
		gcc -o c-parser y.tab.c lex.yy.c -lfl -lm
