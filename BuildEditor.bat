@echo off

set PROJECT_NAME=ProjectName

set "ENGINE_DIR=C:\Program Files\Epic Games\UE_5.1"

if exist "%cd%\%PROJECT_NAME%.uproject" goto Continue

echo.
echo Warning - %PROJECT_NAME%.uproject does not exist!
echo.

pause

goto Exit

:Continue

if exist BUILD_EDITOR_FAILED.txt del BUILD_EDITOR_FAILED.txt

REM - Check if a .sln file exists for the project, if so, then it is a C++ project and you can build the game editor and game.
REM - (otherwise it's a Blueprint project).
if exist "%cd%\%PROJECT_NAME%.sln" (
    echo.
    echo %date% %time% Building Game Editor...
    echo.

    call "%ENGINE_DIR%\Engine\Build\BatchFiles\RunUAT.bat" BuildEditor -Project="%cd%\%PROJECT_NAME%.uproject" -notools
    if errorlevel 1 goto Error_BuildEditorFailed
) else (
    echo.
    echo Solution file missing, please generate it by right-clicking on uproject and selecting Generate Visual Studio project files!

    goto Exit
)

echo.
echo %date% %time% Done!

goto Exit

:Error_BuildEditorFailed
echo.
echo %date% %time% Error - Build Editor failed!
type NUL > BUILD_EDITOR_FAILED.txt
goto Exit


:Exit