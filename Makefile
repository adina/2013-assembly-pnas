all: assembly-paper.pdf

clean: 
	rm -fr *.log *.aux assembly-paper-pnas.pdf assembly-paper-si-pnas.pdf
	
assembly-paper.pdf: assembly-paper-pnas.tex
	xelatex assembly-paper-pnas
	xelatex assembly-paper-pnas
	xelatex assembly-paper-si-pnas
	xelatex assembly-paper-si-pnas
	bibtex assembly-paper-pnas
	bibtex assembly-paper-pnas
	bibtex assembly-paper-si-pnas
	bibtex assembly-paper-si-pnas
	xelatex assembly-paper-pnas
	xelatex assembly-paper-pnas
	xelatex assembly-paper-si-pnas
	xelatex assembly-paper-si-pnas

#e.g. use git show c1275:assembly-paper.tex > OLD-assembly-paper.tex
diff:
	latexdiff-so OLD-assembly-paper.tex assembly-paper.tex > DIFF-assembly-paper.tex
	
	pdflatex DIFF-assembly-paper
	bibtex DIFF-assembly-paper
	pdflatex DIFF-assembly-paper
	pdflatex DIFF-assembly-paper
	
	latexdiff-so OLD-assembly-paper-si.tex assembly-paper-si.tex > DIFF-assembly-paper-si.tex
	pdflatex DIFF-assembly-paper-si
	bibtex DIFF-assembly-paper-si
	pdflatex DIFF-assembly-paper-si
	pdflatex DIFF-assembly-paper-si
