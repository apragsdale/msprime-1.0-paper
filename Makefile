FIGURES=figures/recombination.pdf
GCFIGURES=figures/gene_conversion/gc_perf.pdf

paper.pdf: paper.tex paper.bib ${FIGURES} ${GCFIGURES}
	pdflatex paper.tex
	bibtex paper
	pdflatex paper.tex
	pdflatex paper.tex

figures/recombination.pdf:
	python3 evaluation/recombination.py

figures/gene_conversion/gc_perf.pdf:
	Rscript figures/gene_conversion/plot_performance_gene_conversion.R

paper.ps: paper.dvi
	dvips paper

paper.dvi: paper.tex paper.bib
	latex paper.tex
	bibtex paper
	latex paper.tex
	latex paper.tex


clean:
	rm -f *.log *.dvi *.aux
	rm -f *.blg *.bbl
	rm -f *.eps *.[1-9]
	rm -f src/*.mpx *.mpx

mrproper: clean
	rm -f *.ps *.pdf
