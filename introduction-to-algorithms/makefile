CC=g++

# List of directories
BINDIR=bin
LIBDIR=lib
SRCDIR=src
TESTDIR=test
DIRECTORIES=$(BINDIR) $(LIBDIR)

# Some options used for helpful compiling
#WOPTIONS=-Wall -Wextra -Wuninitialized -Wswitch-enum -Wswitch-default \
	 -Wdouble-promotion -Winit-self -Wold-style-cast -Woverloaded-virtual \
	 -Wmissing-declarations -pedantic -Werror
WOPTIONS=-Wall
INCLUDES=-Isrc -L$(LIBDIR)
CFLAGS=-g -DDEBUG $(WOPTIONS) -std=c++0x -fPIC $(INCLUDES)

PROGRAMS=$(addprefix $(BINDIR)/, insertion-sort)
OBJECTS=$(addprefix $(SRCDIR)/, util.o sorts.o)

all: $(OBJECTS) $(TESTS) $(PROGRAMS)

# Build our binaries
$(BINDIR)/%: $(SRCDIR)/%.cpp $(OBJECTS) | $(BINDIR)
	$(CC) $(CFLAGS) $(OBJECTS) $< -o $@

# Build our binaries
$(BINDIR)/%: $(TESTDIR)/%.cpp $(OBJECTS) | $(BINDIR)
	$(CC) $(CFLAGS) $(OBJECTS) $< -o $@

# Build our objects
$(SRCDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TESTS)
	@find bin -name "test-*" -exec ./{} \;
tests: test

# Make all directories
$(DIRECTORIES):
	mkdir -p $@

# Clean all leftover stuff
clean:
	rm -Rf $(DIRECTORIES)
	find $(SRCDIR)/ -name "*.o" -delete -print
