del *.zip
del /Q .\deliverables\*.*
del /Q .\gerber\seeed\*.*
del /Q .\gerber\renamed\*.*
del /Q .\gerber\*.zip

rem del /Q .\gerber\*.*
rem del /Q .\asm\*.*
rem del /Q .\bom\*.*

rem if exist sch.pdf del sch.pdf
rem if exist 3D.pdf del 3D.pdf
rem if exist cam.pdf del cam.pdf
rem if exist log.pdf del log.pdf

if exist review.txt del review.txt
if exist ord.txt del ord.txt
if exist gerber.txt del gerber.txt
if exist asm.txt del asm.txt
if exist deliverables.txt del deliverables.txt
if exist requirements.txt del requirements.txt
if exist purchase.txt del purchase.txt
if exist integrity.txt del integrity.txt
