$asm = "c:\users\paul\projects\CSpect\snasm.exe"
cd ..\core
.\build.ps1
cd ..\compiler
python fcc.py
Invoke-Expression "$asm .\forth.asm"
