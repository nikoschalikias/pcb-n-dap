
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

echo gerber file set done at %v_datestamp%_%v_timestamp% > .\gerber\gerber-file-set-timestamp.txt

if exist .\gerber\gerberFiles.zip del .\gerber\gerberFiles*.zip

if exist .\gerber\%1.GBL copy .\gerber\%1.GBL .\gerber\renamed\BOTTOM.GBR
if exist .\gerber\%1.GBL copy .\gerber\%1.GBL .\gerber\renamed\BOTTOM.GBR
if exist .\gerber\%1.GTL copy .\gerber\%1.GTL .\gerber\renamed\TOP.GBR
if exist .\gerber\%1.GTO copy .\gerber\%1.GTO .\gerber\renamed\SILK_TOP.GBR
if exist .\gerber\%1.GBO copy .\gerber\%1.GBO .\gerber\renamed\SILK_BOT.GBR
if exist .\gerber\%1.GTS copy .\gerber\%1.GTS .\gerber\renamed\MASK_TOP.GBR
if exist .\gerber\%1.GBS copy .\gerber\%1.GBS .\gerber\renamed\MASK_BOTTOM.GBR
if exist .\gerber\%1.GP1 copy .\gerber\%1.GP1 .\gerber\renamed\PLANE_LAYER1.GBR
if exist .\gerber\%1.GP2 copy .\gerber\%1.GP2 .\gerber\renamed\PLANE_LAYER2.GBR
if exist .\gerber\%1.G1  copy .\gerber\%1.G1  .\gerber\renamed\MID_LAYER1.GBR
if exist .\gerber\%1.G2  copy .\gerber\%1.G2  .\gerber\renamed\MID_LAYER2.GBR
if exist .\gerber\%1.G3  copy .\gerber\%1.G3  .\gerber\renamed\MID_LAYER3.GBR
if exist .\gerber\%1.GTP copy .\gerber\%1.GTP .\gerber\renamed\PASTE_TOP.GBR
if exist .\gerber\%1.GBP copy .\gerber\%1.GBP  .\gerber\renamed\PASTE_BOTTOM.GBR
if exist .\gerber\%1.GM3 copy .\gerber\%1.GM3 .\gerber\renamed\DIMENSIONS.GBR
if exist .\gerber\%1.GM15 copy .\gerber\%1.GM3 .\gerber\renamed\ASSEMBLY.GBR
if exist .\gerber\%1.TXT copy .\gerber\%1.TXT .\gerber\renamed\DRILL.TXT
if exist .\gerber\%1-SlotHoles.TXT copy .\gerber\%1-SlotHoles.TXT .\gerber\renamed\DRILL-SlotHoles.TXT
if exist .\gerber\%1-RoundHoles.TXT copy .\gerber\%1-RoundHoles.TXT .\gerber\renamed\DRILL-RoundHoles.TXT
if exist .\gerber\DIMENSIONS.TXT copy .\gerber\DIMENSIONS.TXT .\gerber\renamed\DIMENSIONS.TXT

if exist .\gerber\renamed\BOTTOM.GBR       .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\BOTTOM.GBR
if exist .\gerber\renamed\TOP.GBR          .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\TOP.GBR
if exist .\gerber\renamed\SILK_TOP.GBR     .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\SILK_TOP.GBR
if exist .\gerber\renamed\SILK_BOT.GBR     .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\SILK_BOT.GBR
if exist .\gerber\renamed\MASK_TOP.GBR     .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\MASK_TOP.GBR
if exist .\gerber\renamed\MASK_BOTTOM.GBR  .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\MASK_BOTTOM.GBR
if exist .\gerber\renamed\PLANE_LAYER1.GBR .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\PLANE_LAYER1.GBR
if exist .\gerber\renamed\PLANE_LAYER2.GBR .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\PLANE_LAYER2.GBR
if exist .\gerber\renamed\MID_LAYER1.GBR   .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\MID_LAYER1.GBR
if exist .\gerber\renamed\MID_LAYER2.GBR   .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\MID_LAYER2.GBR
if exist .\gerber\renamed\MID_LAYER3.GBR   .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\MID_LAYER3.GBR
if exist .\gerber\renamed\PASTE_TOP.GBR .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\PASTE_TOP.GBR
if exist .\gerber\renamed\PASTE_BOTTOM.GBR  .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\PASTE_BOTTOM.GBR
if exist .\gerber\renamed\DRILL.TXT        .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\DRILL.TXT
if exist .\gerber\renamed\DRILL-SlotHoles.TXT        .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\DRILL-SlotHoles.TXT
if exist .\gerber\renamed\DRILL-RoundHoles.TXT        .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\DRILL-RoundHoles.TXT
if exist .\gerber\renamed\DIMENSIONS.GBR   .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\DIMENSIONS.GBR
if exist .\gerber\renamed\DIMENSIONS.TXT   .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\DIMENSIONS.TXT
if exist .\gerber\renamed\ASSEMBLY.GBR   .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\renamed\ASSEMBLY.GBR
if exist .\gerber\all_layers.pdf             .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\all_layers.pdf
if exist .\gerber\all_layers2.pdf            .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\all_layers2.pdf
if exist .\gerber\gerber-file-set-timestamp.txt           .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\gerber-file-set-timestamp.txt
if exist .\gerber\board-definition.xlsx           .\template\7z.exe a -tzip gerberFiles.zip  .\gerber\board-definition.xlsx


if not exist .\gerber\seeed                md .\gerber\seeed
REM 2 LAYERS: 5 GERBER + 1 BOTTOM SILK + 1 GERBER DIMENSIONS + 1 DRILL TOTAL 8 FILES
if exist .\gerber\%1.GTL copy .\gerber\%1.GTL .\gerber\seeed
if exist .\gerber\%1.GBL copy .\gerber\%1.GBL .\gerber\seeed
if exist .\gerber\%1.GTO copy .\gerber\%1.GTO .\gerber\seeed
if exist .\gerber\%1.GBO copy .\gerber\%1.GBO .\gerber\seeed
if exist .\gerber\%1.GTS copy .\gerber\%1.GTS .\gerber\seeed
if exist .\gerber\%1.GBS copy .\gerber\%1.GBS .\gerber\seeed
if exist .\gerber\%1.GM3 copy .\gerber\%1.GM3 .\gerber\seeed\%1.GML
if exist .\gerber\%1.TXT copy .\gerber\%1.TXT .\gerber\seeed

if exist .\gerberFilesSeeed.zip del .\gerberFilesSeeed.zip
if exist .\gerber\seeed\%1.GTL .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.GTL
if exist .\gerber\seeed\%1.GBL .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.GBL
if exist .\gerber\seeed\%1.GTO .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.GTO
if exist .\gerber\seeed\%1.GBO .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.GBO
if exist .\gerber\seeed\%1.GTS .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.GTS
if exist .\gerber\seeed\%1.GBS .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.GBS
if exist .\gerber\seeed\%1.GML .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.GML
if exist .\gerber\seeed\%1.TXT .\template\7z.exe a -tzip gerberFilesSeeed.zip .\gerber\seeed\%1.TXT




if exist gerberFiles.zip copy gerberFiles.zip .\gerber\gerberFiles.zip
rem if exist gerberFiles.zip copy gerberFilesSeeed.zip .\gerber\gerberFilesSeeed.zip
rem if exist gerberFiles.zip copy gerberFiles.zip .\gerber\gerberFiles_%1_%2_%v_datestamp%_%v_timestamp%.zip
rem if exist gerberFiles.zip copy gerberFilesSeeed.zip .\gerber\gerberFilesSeeed_%1_%2_%v_datestamp%_%v_timestamp%.zip

echo gerber file set done at %v_datestamp%_%v_timestamp% > .\template\gerber.txt

