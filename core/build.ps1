$asm = "c:\users\paul\projects\CSpect\snasm.exe"
python scanwords.py
Invoke-Expression "$asm -vice .\core.asm"
python process.py
cp core.bin ..\compiler
cp coreinfo.py ..\compiler
