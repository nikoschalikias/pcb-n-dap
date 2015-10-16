if exist review.zip del review.zip
if exist .\gerber\all_layers.pdf         7z.exe a -tzip  review.zip .\gerber\all_layers.pdf
if exist .\gerber\all_layers2.pdf        7z.exe a -tzip  review.zip .\gerber\all_layers2.pdf
if exist log.pdf    7z.exe a -tzip  review.zip log.pdf
if exist 3D.pdf     7z.exe a -tzip  review.zip 3D.pdf
if exist sch.pdf    7z.exe a -tzip  review.zip sch.pdf
if exist cam.pdf    7z.exe a -tzip  review.zip cam.pdf



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

echo design review file set done at %v_datestamp%_%v_timestamp% > review.txt

