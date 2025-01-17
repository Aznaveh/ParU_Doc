#package minted is need for ParU user guide therfore python3-pygments must 
#  be installed


default: paru_user_guide.pdf

#include ../../SuiteSparse_config/SuiteSparse_config.mk

paru_user_guide.pdf: paru_user_guide.tex paru_user_guide.bib Makefile
	pdflatex --shell-escape  paru_user_guide.tex
	bibtex paru_user_guide
	pdflatex --shell-escape paru_user_guide.tex
	pdflatex --shell-escape paru_user_guide.tex
	- $(RM) -r $(CLEAN) *.out

distclean: purge

clean:
	- $(RM) -r $(CLEAN) 

purge: clean
	- $(RM) -r $(PURGE) *.out paru_user_guide.pdf *.aux *.bbl *.log *.blg _minted-paru_* 

