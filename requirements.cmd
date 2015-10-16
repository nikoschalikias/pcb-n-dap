
if exist requirements.zip  del requirements.zip

7z.exe a -tzip  .\requirements .\requirements\*.*

echo done > requirements.txt


