DIST=cv
JOBNAME=main
TEX=xelatex
ENTRYFILE=$(JOBNAME).tex
SRC=$(ENTRYFILE) abresume.cls
TMP=$(JOBNAME).{aux,log,pdf}

all: $(JOBNAME).pdf

$(JOBNAME).pdf: $(SRC)
	$(TEX) $(ENTRYFILE)

install:
	cp $(JOBNAME).pdf $(DIST).pdf

clean:
	rm -rf $(TMP)

distclean:
	rm -rf $(DIST).pdf

.PHONY: all install clean distclean
