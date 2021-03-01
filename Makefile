#Ivan Stus 
#cssc1943, 821201908
#CS530, Spring 2020
#Assignment #3, Grammar Parser
#Makefile


EXEC = exp
CC = g++

$(EXEC).tab.c $(EXEC).tab.h: $(EXEC).y
	bison -d $(EXEC).y
lex.yy.c: $(EXEC).l $(EXEC).tab.h
	flex $(EXEC).l

$(EXEC): lex.yy.c $(EXEC).tab.c $(EXEC).tab.h
	$(CC) $(EXEC).tab.c lex.yy.c -o $(EXEC) 