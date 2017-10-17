PRJ=N-DAP
REV=V3
NEWPRJ=TEST_PROJECT
DVCS=HG

GER1 :=.\gerber\$(PRJ).EXTREP
GER_FILES =$(GER1) .\gerber\all_layers.pdf .\gerber\all_layers2.pdf

REVIEW_FILES =\
.\gerber\all_layers.pdf \
.\gerber\all_layers2.pdf \
log.pdf \
3D.pdf \
sch.pdf \
cam.pdf

ASM_FILES =\
.\asm\placeplan_mech15_smartpdf.PDF \
.\asm\Pick_Place.csv \
.\asm\Pick_Place.txt \
.\asm\Pick_Place.xlsx \
.\gerber\all_layers.pdf \
.\gerber\all_layers2.pdf \
.\3D.pdf \
.\bom\PartsList.csv \
.\bom\PartsList.xlsx

SCH := $(wildcard *.PcbDoc)
PCB := $(wildcard *.PcbDoc)
ORD := $(wildcard .\ord\*)

DELIVERABLES_FILES = $(GERBER_FILES) $(REVIEW_FILES) $(ASM_FILES) $(PURCHASE_FILES) $(SCH) $(PCB) \
$(REQUIREMENTS_FILES) review.txt gerber.txt requirements.txt

PURCHASE_FILES =.\bom\PurchaseList.pdf .\bom\PurchaseList.csv .\bom\PurchaseList.xlsx

REQUIREMENTS_FILES = .\requirements\requirements_text.txt


all:  gerber.txt asm.txt purchase.txt  requirements.txt review.txt deliverables.txt integrity

review.txt: $(REVIEW_FILES)
	review.cmd

gerber.txt: $(GER_FILES)
	gerber.cmd $(PRJ) $(REV)

asm.txt: $(ASM_FILES)
	asm.cmd 

purchase.txt: $(PURCHASE_FILES)
	purchase.cmd 	

deliverables.txt: $(DELIVERABLES_FILES)
	deliverables.cmd $(PRJ) $(REV)

requirements.txt: $(REQUIREMENTS_FILES)
	requirements.cmd 

clean:
	clean.cmd

project:
	project.cmd $(NEWPRJ) $(DVCS) 

integrity:
	integrity.cmd

cleanDeep:
	cleanDeep.cmd



