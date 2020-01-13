PRJ=N-DAP
REV=V3
NEWPRJ=TEST_PROJECT
DVCS=HG

GER1 :=.\gerber\$(PRJ).EXTREP
GER_FILES =$(GER1) .\gerber\all_layers.pdf

REVIEW_FILES =\
.\gerber\all_layers.pdf \
#    log.txt \
3D.pdf \
sch.pdf \
#    cam.pdf

ASM_FILES =\
#  .\asm\placeplan_mech15_smartpdf.PDF \
.\asm\Pick_Place.csv \
# .\asm\Pick_Place.txt \
.\gerber\all_layers.pdf \
.\3D.pdf \
# .\asm\Pick_Place_LP.csv
# .\bom\PartsList.xlsx


SCH := $(wildcard *.PcbDoc)
PCB := $(wildcard *.PcbDoc)
ORD := $(wildcard .\ord\*)

DELIVERABLES_FILES = $(GERBER_FILES) $(REVIEW_FILES) $(ASM_FILES) $(PURCHASE_FILES) $(SCH) $(PCB) \
$(REQUIREMENTS_FILES) .\template\review.txt .\template\gerber.txt .\template\requirements.txt

PURCHASE_FILES =.\bom\PurchaseList.xlsx

REQUIREMENTS_FILES = .\requirements\requirements_text.txt


all:  .\template\gerber.txt .\template\asm.txt .\template\purchase.txt  .\template\requirements.txt .\template\review.txt .\template\deliverables.txt .\template\integrity

.\template\review.txt: $(REVIEW_FILES)
	.\template\review.cmd

.\template\gerber.txt: $(GER_FILES)
	.\template\gerber.cmd $(PRJ) $(REV)

.\template\asm.txt: $(ASM_FILES)
	.\template\asm.cmd
	.\template\r-LP.cmd

.\template\purchase.txt: $(PURCHASE_FILES)
	.\template\purchase.cmd

.\template\deliverables.txt: $(DELIVERABLES_FILES)
	.\template\deliverables.cmd $(PRJ) $(REV)

.\template\requirements.txt: $(REQUIREMENTS_FILES)
	.\template\requirements.cmd

clean:
	.\template\clean.cmd

.\template\project:
	.\template\project.cmd $(NEWPRJ) $(DVCS)

.\template\integrity:
	.\template\integrity.cmd

cleanDeep:
	.\template\cleanDeep.cmd


