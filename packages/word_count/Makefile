wc: lex.yy.c
	cc -o $@ $< -lfl 

lex.yy.c: wc.l
	flex $< 


.Proxy: clean
clean:
	-rm  *.c *.h *.output  *.out wc