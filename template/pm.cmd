
if exist pm.zip  del pm.zip

.\template\7z.exe a -tzip  .\pm .\pm\*.*

echo done > .\template\pm.txt


