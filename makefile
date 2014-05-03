PROGS=new sujit

all:$(PROGS)

#%.o : %.d
#        ghc $(CLG) -c -o $@ $<

% : %.d
	dmd -g $<

clean:
	-rm *.o $(PROGS)
