
if exist .\ASM\Pick_Place_LP.csv replacer.exe  replace_template_LP.txt .\ASM\Pick_Place_LP.csv .\ASM\Pick_Place_UPDATED_LP.csv -r
cd .\ASM
removeLines.py
cd ..


