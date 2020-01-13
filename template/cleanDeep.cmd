del *.zip
del /Q .\deliverables\*.*
del /Q .\gerber\seeed\*.*
del /Q .\gerber\renamed\*.*
del /Q .\gerber\*.zip

del /Q .\gerber\*.*
del /Q .\asm\*.*
del /Q .\bom\*.*

if exist sch.pdf del sch.pdf
if exist 3D.pdf del 3D.pdf
if exist cam.pdf del cam.pdf
if exist log.pdf del log.pdf

if exist .\template\review.txt del .\template\review.txt
if exist .\template\ord.txt del .\template\ord.txt
if exist .\template\gerber.txt del .\template\gerber.txt
if exist .\template\asm.txt del .\template\asm.txt
if exist .\template\deliverables.txt del .\template\deliverables.txt
if exist .\template\requirements.txt del .\template\requirements.txt
if exist .\template\purchase.txt del .\template\purchase.txt
if exist .\template\integrity.txt del .\template\integrity.txt
