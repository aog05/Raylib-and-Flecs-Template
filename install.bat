@echo off
setlocal enabledelayedexpansion

REM Using Raylib 5.5 and Flecs 4.1.4

set "RAFT_NAME=Raylib-and-Flecs-Template"
set "ARCHITECTURE=%PROCESSOR_ARCHITECTURE%"
set BAKEEXE=%USERPROFILE%\bake\bakebin.exe

echo Starting install...

REM Check if bake is installed
%BAKEEXE% --version >nul 2>&1
if errorlevel 1 (
    echo Please install bake before using this tool
    echo.
    set /p "response=Do you want this script to install bake for you? (y/n): "
    
    if /i "!response!"=="y" (
        echo Installing bake to %USERPROFILE%...
        git clone -q --progress https://github.com/SanderMertens/bake %USERPROFILE%\bake_temp
        cd %USERPROFILE%\bake_temp
        call setup
        cd %USERPROFILE%
        rmdir /s /q %USERPROFILE%\bake_temp

        echo Open a new terminal and run this script again to finish setup
        exit /b 0
    ) else if /i "!response!"=="n" (
        exit /b 0
    ) else (
        echo Invalid input (!response!)
        exit /b 1
    )
)

echo.
echo Building Flecs package...
cd %USERPROFILE%\bake
if exist flecs rmdir /s /q flecs >nul 2>&1
%BAKEEXE% new flecs --package >nul 2>&1
curl -so ./flecs/src/flecs.c https://raw.githubusercontent.com/SanderMertens/flecs/master/distr/flecs.c
curl -so ./flecs/include/flecs.h https://raw.githubusercontent.com/SanderMertens/flecs/master/distr/flecs.h
del .\flecs\src\main.c
%BAKEEXE% flecs --cfg debug >nul 2>&1
%BAKEEXE% flecs --cfg release >nul 2>&1
%BAKEEXE% flecs --cfg sanitize >nul 2>&1

echo.
echo Getting Raylib library...
REM Download Raylib for Windows
if "%ARCHITECTURE%"=="AMD64" goto ARCHITECTURE_64
if "%ARCHITECTURE%"=="IA64" goto ARCHITECTURE_64
if "%ARCHITECTURE%"=="ARM64" goto ARCHITECTURE_64
goto ARCHITECTURE_32

:ARCHITECTURE_64
curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win64_msvc16.zip
tar -xf raylib-5.5_win64_msvc16.zip
move raylib-5.5_win64_msvc16\lib\raylibdll.lib lib\
move raylib-5.5_win64_msvc16\lib\raylib.dll lib\
rmdir /s /q raylib-5.5_win64_msvc16
del /q raylib-5.5_win64_msvc16.zip
goto ARCHITECTURE_END

:ARCHITECTURE_32
curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win32_msvc16.zip
tar -xf raylib-5.5_win32_msvc16.zip
move raylib-5.5_win32_msvc16\lib\raylibdll.lib lib\
move raylib-5.5_win32_msvc16\lib\raylib.dll lib\
rmdir /s /q raylib-5.5_win32_msvc16
del /q raylib-5.5_win32_msvc16.zip

:ARCHITECTURE_END

REM Get Raylib WASM
curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_webassembly.zip
tar -xf raylib-5.5_webassembly.zip
move raylib-5.5_webassembly\lib\libraylib.a raylib-5.5_webassembly\lib\libraylibweb.a
move raylib-5.5_webassembly\lib\libraylibweb.a lib\
rmdir /s /q raylib-5.5_webassembly
del /q raylib-5.5_webassembly.zip

echo.
echo Getting Raylib and Flecs Template...
if exist %RAFT_NAME% rmdir /s /q %RAFT_NAME% >nul 2>&1
git clone -q --progress https://github.com/aog05/Raylib-and-Flecs-Template.git %RAFT_NAME%
%BAKEEXE% %RAFT_NAME% >nul 2>&1

echo.
echo All done! Create a new project with:
echo bake new my_game -t RaFT
echo.
echo Run the game using in the game's directory:
echo bake run

endlocal
