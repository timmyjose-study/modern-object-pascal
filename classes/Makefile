PAS := fpc
PASFLAGS := -g -Cg-

SRC := $(wildcard *.pas)
OBJS := $(patsubst %.pas, %.o, $(SRC))
EXES := $(basename $(OBJS))

all: $(EXES)

$(EXES): %: %.pas
	$(PAS) $(PASFLAGS) $<

.PHONY: clean
clean:
	rm -f $(EXES) $(OBJS) 