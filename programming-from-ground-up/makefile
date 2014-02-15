# List of directories
BINDIR=bin
LIBDIR=lib
SRCDIR=src
DIRECTORIES=$(BINDIR) $(LIBDIR)

# Objects to build
OBJECTS=$(addprefix src/, exit.o)

# Programs which compile
PROGRAMS=$(addprefix $(BINDIR)/, exit \
	 maxvalue \
	 maxvalue-length \
	 minvalue \
	 power \
	 power-zero\
	 )

# @target: all
#
# Build all binaries
all: $(PROGRAMS)

# Compile all .asm files into object files
$(SRCDIR)/%.o: $(SRCDIR)/%.asm
	as $< -o $@

# Compile all standalone object programs into binaries
$(BINDIR)/%: $(SRCDIR)/%.o | $(BINDIR)
	ld $< -o $@

# @target: $(DIRECTORIES) as i; $i
#
# Make all directories
$(DIRECTORIES):
	mkdir -p $@

# @target: clean
#
# Clean all leftover stuff
clean:
	rm -Rf $(DIRECTORIES)
	find src/ -name "*.o" -delete -print
