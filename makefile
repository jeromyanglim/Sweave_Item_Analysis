outputDir = .output
rnwfile = Item_Analysis_Report
backupDir = .backup

all:
	R CMD Sweave $(rnwfile).Rnw
	-mkdir $(outputDir)
	-cp *.sty $(outputDir)
	-mv *.tex *.pdf *.eps $(outputDir)
	cd $(outputDir); texify --run-viewer --pdf $(rnwfile).tex 

Stangle:
	R CMD Stangle $(rnwfile).Rnw
	-mkdir $(outputDir) 
	-mv $(rnwfile).R $(outputDir)

tex:
	cd $(outputDir); texify --run-viewer --pdf $(rnwfile).tex

clean:
	-rm $(outputDir)/*
	
backup:
	-mkdir $(backupDir)
	cp 	$(outputDir)/$(rnwfile).pdf $(backupDir)/$(rnwfile).pdf 