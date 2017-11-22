INFILE			= Notes.rst
OUTFILE_Name	= Notes

epub:
	pandoc --from=rst --toc --to=epub $(INFILE) \
    -V --stylesheet=templates\stylesheet_2.css \
    --epub-metadata=metadata.xml \
	--epub-cover-image=images\xkcd_tribute__think_positive_by_technonerd0110.jpg \
	-o  $(OUTFILE_Name).epub
html:      
	pandoc --from=rst --toc -c templates\pandoc.css --to=html $(INFILE) \
	-o  $(OUTFILE_Name).html

docx:     
	pandoc --from=rst --toc --to=docx $(INFILE) \
	-o  $(OUTFILE_Name).docx

pdf:     
	pandoc --from=rst --toc --to=latex $(INFILE) \
	-o $(OUTFILE_Name).pdf

slides:
	pandoc --from=rst -t beamer $(INFILE) \
	-o $(OUTFILE_Name)_slides.pdf

reader_pdf:
	pandoc -N --template=templates/eisvogel.tex --toc --from=rst --to=latex \
	-V titlepage=true $(INFILE) \
	-o $(OUTFILE_Name).pdf

clean:
	rm -rf  $(OUTFILE_Name).epub
	rm -rf  $(OUTFILE_Name).html
	rm -rf  $(OUTFILE_Name).docx
	rm -rf  $(OUTFILE_Name).pdf
	rm -rf  $(OUTFILE_Name).pdf
	rm -rf  $(OUTFILE_Name)_slides.pdf


all: html docx pdf epub reader_pdf


define draw_line
    @echo "========================================"
endef



help:
	$(call draw_line)
	@echo "make <target>"
	@echo "targets:"
	@echo "  pdf 		(make sure pdftex is setup properly)"
	@echo "  reader_pdf (pdf output for the reader)"
	@echo "  docx"
	@echo "  html"
	@echo "  slides"

	$(call draw_line)

	
