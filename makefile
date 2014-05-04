PROGS=new sujit

all:$(PROGS)

#%.o : %.d
#        ghc $(CLG) -c -o $@ $<

% : %.d
	dmd -g $<

install:sujit
	install -o 0 -g 0 -m4711 sujit /usr/local/bin/
	install -o jerry -g jerry -m755 new /usr/local/bin/

clean:
	-rm *.o $(PROGS)
