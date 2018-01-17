NAME=ms
SECTIONS=code-tests.tex conclusions.tex \
	introduction.tex local-commands.tex \
	physics-algorithms.tex appendix.tex \
	code-architecture.tex
LATEX=latex -interaction=nonstopmode

all:  $(NAME).pdf

dvi: $(NAME).tex $(SECTIONS)
	$(LATEX) $(NAME) || true
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	$(LATEX) $(NAME)

$(NAME).pdf: $(NAME).tex $(SECTIONS)
	$(LATEX) $(NAME) || true
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	bibtex $(NAME)
	$(LATEX) $(NAME) || true 
	$(LATEX) $(NAME) || true 
	dvipdf $(NAME).dvi $(NAME).pdf
	rm -f $(NAME).blg $(NAME).log $(NAME).aux

clean:
	rm -f *~ *.aux *.dvi *.gz *.out *.toc *log *-temp.* *.blg *~ $(NAME).ps $(NAME).bbl $(NAME).pdf


