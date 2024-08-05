
BIBTEX = bibtex
# LATEX = pdflatex
LATEX = xelatex
DVIPS = dvips
PS2PDF = ps2pdf
TEMPLATE = ieee

VERSION = 0.1.0

SOURCES = $(wildcard ./*.*)

NPROCS := 1
OS := $(shell uname)
export NPROCS

ifeq ($J,)

ifeq ($(OS),Linux)
  NPROCS := $(shell grep -c ^processor /proc/cpuinfo)
else ifeq ($(OS),Darwin)
  # NPROCS := $(shell system_profiler | awk '/Number of CPUs/ {print $$4}{next;}')
  NPROCS := 1
endif # $(OS)

else
  NPROCS := $J
endif # $J

.PHONY: all clean dist-clean

TEX_FILES := $(shell find . -type f -name "*.tex")
MD_FILES := $(shell find . -type f -name "*.md" | grep -v "README.md")

all: convert
	@echo "Using" $(NPROCS) "jobs"
	@for file in $(TEX_FILES); do \
	    echo "Processing $$file"; \
	    latexmk -xelatex $$file; \
	done
	@for file in $(shell find . -type f -name "*.pdf"); do \
		echo "----- $$file"; \
		pdfinfo $$file; \
	done

convert:
	@echo files: $(MD_FILES)
	@for file in $(MD_FILES); do \
	    echo "Converting $$file" using $(TEMPLATE); \
	    output=$${file%.md}.tex; \
	    pandoc --read=markdown --write=latex --output=testdoc.tex --template=$(TEMPLATE).latex $$file -o $$output --listings --biblatex --csl abnt.csl ; \
	done

$(TARGET): $(MAIN_FILE) $(SOURCES)
	$(MAKE) clean
	$(LATEX) $(MAIN_FILE)
	$(LATEX) -interaction=batchmode $(MAIN_FILE)
	@mv $(PDF_FILE) $(TARGET)

clean:
	rm -rf *~ *.dvi *.ps *.backup *.aux *.log *.out *.xdv *.fls *.fdb_latexmk
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx *.lol *.bcf *.xml

install:
	apt update -qq
	apt install -y pandoc pandoc-citeproc latexmk
	cp -v *.ttf /usr/local/share/fonts
	fc-cache -fv