$asm = "c:\users\paul\projects\CSpect\snasm.exe"
Invoke-Expression "$asm -vice .\core.asm"
python process.py
cp core.bin ..\compiler
cp coreinfo.py ..\compiler
