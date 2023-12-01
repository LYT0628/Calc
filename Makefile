mycalc: y.tab.c y.tab.h lex.yy.c 
	cc -o $@ $^
 
y.tab.c y.tab.h : mycalc.y
	yacc -dv $^


lex.yy.c: mycalc.l
	lex $^



.Proxy: clean
clean:
	rm -rf *.c *.h *.output mycalc
	
