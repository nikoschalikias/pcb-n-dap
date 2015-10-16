
if not exist ..\%1                md ..\%1
if not exist ..\%1\gerber         md ..\%1\gerber
if not exist ..\%1\gerber\renamed md ..\%1\gerber\renamed
if not exist ..\%1\gerber\seeed md ..\%1\gerber\seeed
if not exist ..\%1\asm            md ..\%1\asm
if not exist ..\%1\requirements   md ..\%1\requirements
if not exist ..\%1\bom            md ..\%1\bom
if not exist ..\%1\deliverables   md ..\%1\deliverables
if not exist ..\%1\ord   md ..\%1\ord

if exist make.exe              copy make.exe  ..\%1
if exist 7z.exe                copy 7z.exe    ..\%1
if exist makefile              copy makefile  ..\%1
if exist PurchaseList.xlt*     copy PurchaseList.xlt*      ..\%1
if exist template1.pcbdoc      copy template1.pcbdoc   ..\%1
if exist template2.pcbdoc      copy template2.pcbdoc   ..\%1
if exist template3.pcbdoc      copy template3.pcbdoc   ..\%1
if exist template4.pcbdoc      copy template4.pcbdoc   ..\%1
if exist template1.schdoc      copy template1.schdoc   ..\%1
if exist template2.schdoc      copy template2.schdoc   ..\%1
if exist template3.schdoc      copy template3.schdoc   ..\%1
if exist template4.schdoc      copy template4.schdoc   ..\%1


if exist ..\%1             copy *.OUTJOB    ..\%1
if exist ..\%1             copy *.cmd       ..\%1
if exist ..\%1             copy *.xltx      ..\%1
if exist ..\%1\requirements             copy .\requirements\*.*      ..\%1\requirements
if exist ..\%1             copy *.py      ..\%1
if exist ..\%1             copy _2.do     ..\%1

if exist ..\%1\gerber copy .\gerber\*.scr ..\%1\gerber

echo [%1] project created > ..\%1\readme.md

set myPath=%cd%
pushd ..
set parentPath=%cd%
cd %1
echo parentPath = "%parentPath%"
if [%2]==[HG] hg init %parentPath%\%1
if [%2]==[HG] hg add -- %parentPath%\%1\readme.txt
if [%2]==[HG] hg commit --verbose "--message=hg repository created automatically by make" --user automake -- %parentPath%\%1\readme.md
cd ..
popd







