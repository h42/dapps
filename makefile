all:jpd

#%.o : %.d
#        ghc $(CLG) -c -o $@ $<

% : %.d
	dmd -g $<

