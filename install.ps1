# Using Raylib 5.5 and Flecs 4.1.4

$RAFT_NAME = "Raylib-and-Flecs-Template"
$ARCHITECTURE = $env:PROCESSOR_ARCHITECTURE
$BAKEEXE = "$env:USERPROFILE\bake\bakebin.exe"
# $ERRORACTIONPREFERENCE = "silentlycontinue"

Write-Host "Starting install..."

# Check if bake is installed
& $BAKEEXE --version *> $null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Please install bake before using this tool"
    Write-Host ""
    $response = Read-Host "Do you want this script to install bake for you? (y/n)"
    
    if ($response -ieq "y") {
        Write-Host "Installing bake to $env:USERPROFILE..."
        git clone -q --progress https://github.com/SanderMertens/bake "$env:USERPROFILE\bake_temp"
        Set-Location "$env:USERPROFILE\bake_temp"
        & .\setup
        Set-Location $env:USERPROFILE
        Remove-Item -Recurse -Force "$env:USERPROFILE\bake_temp"

        Write-Host "Open a new terminal and run this script again to finish setup"
        exit 0
    } elseif ($response -ieq "n") {
        exit 0
    } else {
        Write-Host "Invalid input ($response)"
        exit 1
    }
}

Write-Host ""
Write-Host "Building Flecs package..."
Set-Location "$env:USERPROFILE\bake"
if (Test-Path "flecs") {
    Remove-Item -Recurse -Force "flecs" *> $null
}
& $BAKEEXE new flecs --package *> $null
curl -so ./flecs/src/flecs.c https://raw.githubusercontent.com/SanderMertens/flecs/master/distr/flecs.c
curl -so ./flecs/include/flecs.h https://raw.githubusercontent.com/SanderMertens/flecs/master/distr/flecs.h
Remove-Item .\flecs\src\main.c
& $BAKEEXE flecs --cfg debug *> $null
& $BAKEEXE flecs --cfg release *> $null
& $BAKEEXE flecs --cfg sanitize *> $null

Write-Host ""
Write-Host "Getting Raylib library..."
# Download Raylib for Windows
if ($ARCHITECTURE -in @("AMD64", "IA64", "ARM64")) {
    # 64-bit architecture
    curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win64_msvc16.zip
    tar -xf raylib-5.5_win64_msvc16.zip
    Move-Item raylib-5.5_win64_msvc16\lib\raylibdll.lib lib\
    Move-Item raylib-5.5_win64_msvc16\lib\raylib.dll lib\
    Remove-Item -Recurse -Force raylib-5.5_win64_msvc16
    Remove-Item -Force raylib-5.5_win64_msvc16.zip
} else {
    # 32-bit architecture
    curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win32_msvc16.zip
    tar -xf raylib-5.5_win32_msvc16.zip
    Move-Item raylib-5.5_win32_msvc16\lib\raylibdll.lib lib\
    Move-Item raylib-5.5_win32_msvc16\lib\raylib.dll lib\
    Remove-Item -Recurse -Force raylib-5.5_win32_msvc16
    Remove-Item -Force raylib-5.5_win32_msvc16.zip
}

# Get Raylib WASM
curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_webassembly.zip
tar -xf raylib-5.5_webassembly.zip
Move-Item raylib-5.5_webassembly\lib\libraylib.a raylib-5.5_webassembly\lib\libraylibweb.a
Move-Item raylib-5.5_webassembly\lib\libraylibweb.a lib\
Remove-Item -Recurse -Force raylib-5.5_webassembly
Remove-Item -Force raylib-5.5_webassembly.zip

Write-Host ""
Write-Host "Getting Raylib and Flecs Template..."
if (Test-Path $RAFT_NAME) {
    Remove-Item -Recurse -Force $RAFT_NAME *> $null
}
git clone -q --progress https://github.com/aog05/Raylib-and-Flecs-Template.git $RAFT_NAME
& $BAKEEXE $RAFT_NAME *> $null

Write-Host ""
Write-Host "All done! Create a new project with:"
Write-Host "bake new my_game -t RaFT"
Write-Host ""
Write-Host "Run the game using in the game's directory:"
Write-Host "bake run"