if exist deliverables.txt del deliverables.txt
if exist .\deliverables  del /Q .\deliverables\*.*
md .\deliverables

7z.exe a -tzip  cad.zip *.schdoc *.pcbdoc *.cam
7z.exe a -tzip  ord.zip .\ord\*.*

if exist review.zip          copy review.zip  .\deliverables
copy .\gerber\gerberFiles*.zip   .\deliverables
rem remove unstamped gerberFiles.zip
if exist .\deliverables\gerberFiles.zip del .\deliverables\gerberFiles.zip 
if exist .\deliverables\gerberFilesSeeed.zip del .\deliverables\gerberFilesSeeed.zip 
if exist cad.zip             copy cad.zip  .\deliverables
if exist cad.zip             copy cad.zip  .\deliverables
if exist ord.zip             copy ord.zip   .\deliverables
if exist purchase.zip        copy purchase.zip   .\deliverables
if exist asm.zip             copy asm.zip   .\deliverables
if exist requirements.zip    copy requirements.zip  .\deliverables

del /Q *.*zip


:STEP_DATESTAMP
::
REM Setting Datestamp to YYYYMMDD
set v_datestampYYYY=%date:~6,4%
set v_datestampMM=%date:~3,2%
set v_datestampDD=%date:~0,2%
set v_datestamp=%v_datestampYYYY%%v_datestampMM%%v_datestampDD%
::
REM Setting Timestamp to HHMMSS
set HH=%time:~0,2%
:: ensure that hour is always 2 digits
if %HH%==0 set HH=00
if %HH%==1 set HH=01
if %HH%==2 set HH=02
if %HH%==3 set HH=03
if %HH%==4 set HH=04
if %HH%==5 set HH=05
if %HH%==6 set HH=06
if %HH%==7 set HH=07
if %HH%==8 set HH=08
if %HH%==9 set HH=09
set MM=%time:~3,2%
set SS=%time:~6,2%
set v_timestamp=%HH%%MM%%SS% 


7z.exe a -tzip  .\deliverables_%1_%2_%v_datestamp%_%v_timestamp% .\deliverables\*.*
7z.exe a -tzip  .\deliverables .\deliverables\*.*

echo done > deliverables.txt


