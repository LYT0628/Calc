mycalc: mycalc.tab.c mycalc.tab.h lex.yy.c 
	cc -o $@ $^ -lfl
 
mycalc.tab.c mycalc.tab.h : mycalc.y
	bison -d $^


lex.yy.c: mycalc.l
	flex $^



.Proxy: clean
clean:
	rm -rf *.c *.h *.output mycalc
	
