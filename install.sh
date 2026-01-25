# Using Raylib 5.5 and Flecs 4.1.4

RAFT_NAME="Raylib-and-Flecs-Template"
OS_NAME=$(uname -s)
ESC="\033"

echo "$ESC[1;34mStarting install...$ESC[0m"

if ! bake --version > /dev/null 2>&1; then
    echo "Please install bake before using this tool"

    read -p "Do you want this script to install bake for you? (y/n): " response

    if [[ $response == "y" ]]; then
        echo "Installing bake to $HOME..."
        git clone -q --progress https://github.com/SanderMertens/bake $HOME/bake_temp
        $HOME/bake_temp/setup.sh
        rm -rf $HOME/bake_temp
    elif [[ $response == "n" ]]; then
        exit 0
    else
        echo "Invalid input ($response)"
        exit 1
    fi
fi

echo ""
echo "$ESC[1;34mBuilding Flecs package...$ESC[0m"
cd $HOME/bake
rm -rf flecs > /dev/null
bake new flecs --package > /dev/null
curl -so ./flecs/src/flecs.c https://raw.githubusercontent.com/SanderMertens/flecs/master/distr/flecs.c
curl -so ./flecs/include/flecs.h https://raw.githubusercontent.com/SanderMertens/flecs/master/distr/flecs.h
rm ./flecs/src/main.c
bake flecs --cfg debug > /dev/null
bake flecs --cfg release > /dev/null
bake flecs --cfg sanitize > /dev/null

echo ""
echo "$ESC[1;34mGetting Raylib library...$ESC[0m"
if [[ $OS_NAME == "Darwin" ]]; then
    curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_macos.tar.gz
    tar -xzf raylib-5.5_macos.tar.gz
    mv raylib-5.5_macos/lib/libraylib.a lib
    rm -rf raylib-5.5_macos
    rm raylib-5.5_macos.tar.gz
elif [[ $OS_NAME == "Linux" ]]; then
    curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_linux_amd64.tar.gz
    tar -xzf raylib-5.5_linux_amd64.tar.gz
    mv raylib-5.5_linux_amd64/lib/libraylib.a lib
    rm -rf raylib-5.5_linux_amd64
    rm raylib-5.5_linux_amd64.tar.gz
fi

# Get Raylib WASM
curl -sOL https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_webassembly.zip
tar -xf raylib-5.5_webassembly.zip
mv raylib-5.5_webassembly/lib/libraylib.a raylib-5.5_webassembly/lib/libraylibweb.a
mv raylib-5.5_webassembly/lib/libraylibweb.a lib
rm -rf raylib-5.5_webassembly
rm raylib-5.5_webassembly.zip

echo ""
echo "$ESC[1;34mGetting Raylib and Flecs Template...$ESC[0m"
rm -rf $RAFT_NAME > /dev/null
git clone -q --progress https://github.com/aog05/Raylib-and-Flecs-Template.git $RAFT_NAME
bake $RAFT_NAME > /dev/null

echo ""
echo "$ESC[1;32mAll done! Create a new project with:$ESC[0m"
echo "$ESC[1mbake new my_game -t RaFT$ESC[0m"
echo ""
echo "$ESC[1;32mRun the game using in the game's directory:$ESC[0m"
echo "$ESC[1mbake run$ESC[0m"
