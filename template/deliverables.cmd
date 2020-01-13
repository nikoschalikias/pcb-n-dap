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


if exist deliverables.txt del deliverables.txt
if exist .\deliverables  del /Q .\deliverables\*.*
md .\deliverables

.\template\7z.exe a -tzip  cad.zip *.schdoc *.pcbdoc *.cam
.\template\7z.exe a -tzip  ord.zip .\ord\*.*
rem  7z.exe a -tzip  ODB.zip .\ODB\*.*

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
rem  if exist ODB.zip    copy ODB.zip  .\deliverables
.\template\7z.exe a -tzip  .\deliverables .\deliverables\*.*

if exist .\manufacture\gerberFiles.zip del  .\manufacture\gerberFiles.zip 
if exist .\gerber\gerberFiles.zip      copy .\gerber\gerberFiles.zip .\manufacture
if exist .\manufacture\PurchaseList.xlsx del  .\manufacture\PurchaseList.xlsx
if exist .\manufacture\manufacture_%1_%2.zip del  .\manufacture\manufacture_%1_%2.zip
if exist .\bom\PurchaseList.xlsx      copy .\bom\PurchaseList.xlsx .\manufacture
if exist .\bom\bom.xlsx      copy .\bom\bom.xlsx .\manufacture
if exist .\manufacture\Pick_Place.csv del  .\manufacture\Pick_Place.csv
if exist .\asm\Pick_Place.csv      copy .\asm\Pick_Place.csv .\manufacture
echo manufacturer file set done at %v_datestamp%_%v_timestamp% > .\manufacture\manufacture-file-set-timestamp.txt
.\template\7z.exe a -tzip  .\manufacture\manufacture_%1_%2.zip .\manufacture\*.*

del /Q *.*zip

rem 7z.exe a -tzip  .\deliverables_%1_%2_%v_datestamp%_%v_timestamp% .\deliverables\*.*

echo deliverables done at %v_datestamp%_%v_timestamp%  > .\template\deliverables.txt




