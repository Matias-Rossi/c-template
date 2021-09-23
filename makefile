 # 1. Assign the program name to the PROGRAM variable
 # 2. Assign (if req.) whatever suffix is needed for release zip in RELSUFFIX
 # 3. Type needed libraries in LIBS
 # 4. Change other directories (as required)

PROGRAM=programName
RELSUFFIX=

LIBS=
TESTLIBS=-lcspecs

CC=gcc
CFLAGS=-Iinclude -g -Wall

OBJ=build
SRC=src

OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))
SRCS=$(wildcard $(SRC)/*.c)

BINDIR=bin
BIN=$(BINDIR)/$(PROGRAM)

TESTDIR=tests
TESTS=$(wildcard $(TESTDIR)/*.c)
TESTBINS=$(patsubst $(TESTDIR)/%.c,$(TESTDIR)/bin/% , $(TESTS))

all:$(BIN)

release: CFLAGS=-Iinclude -Wall -O2 -DNDEBUG
release: clean
release: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LIBS)

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(LIBS)

$(TESTDIR)/bin/%: $(TESTDIR)/%.c $(BIN)
	$(CC) $(CFLAGS) $< $(OBJS) -o $@ $(LIBS) $(TESTLIBS)

$(TESTDIR)/bin:
	mkdir $@

.PHONY: test
test: $(TESTDIR)/bin/ $(TESTBINS)
	for test in $(TESTBINS) ; do ./$$test ; done

.PHONY: clean
clean:
	$(RM) -r $(BINDIR)/* $(OBJ)/* $(TESTDIR)/bin/*

.PHONY: submit
submit:
	$(RM) $(SUBMITNAME)
	zip $(PROGRAM)_$(RELSUFFIX) $(BIN)