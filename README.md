### I do not own these libraries

_This is a template that I have made using both Raylib and Flecs libraries using the Bake Build System._

_Please note that neither [Raylib](https://github.com/raysan5/raylib) nor [Flecs](https://github.com/SanderMertens/flecs/tree/master) belong to me. I have only created this template for ease-of-use for any developers who desire to start using Flecs and Raylib._

# ------ SETTING UP THE PROJECT ------

If this is your first time setting up a project, I will walk you through all of the steps for getting started.

## MacOS or Linux (3 Steps!)

**1. Get the install.sh script**

After downloading the script, go into a terminal and enter these command:

```bash
cd path/to/install.sh
sh install.sh
```

If you don't already have it, this script will ask you if you want to install the bake build system. You will need it in order to use this template.

**2. Make a project**

After the install finishes, create and run a project using the Raylib and Flecs Template.

```bash
bake new my_game -t RaFT
```

**3. Run your game!**

Try `bake run my_game` to see your game running.

Open a code editor, like VS Code, at your game's location and run `bake run` in the terminal.
You can also use the play button ▶ or hit `F5` to run the game.

## Windows (A Few More Steps)

Run the program with: `bake run`.

If you ever want to make a new project, all you have to do is repeat this step.

## Windows

> Windows is a slightly tougher version to build for, so if there are any problems, you can report them [here](https://github.com/aog05/Raylib-and-Flecs-Template/issues) or on [Discord](https://discord.gg/QzBM86a2Pj).

**1. Install Visual Studio Build Tools**

First, follow this link ([Download Bulid Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2026)) and go down to "Tools for Visual Studio" and click download on "Build Tools for Visual Studio" at the bottom of the selection.

Once it finishes downloading, open the Visual Studio Installer and click "Modify". After that, select "Desktop Development with C++" and click "Modify" in the bottom right. You can close the installer once it finishes installing.

**2. Download the install.bat script**

Install the install.bat file that's in this repository.

**3. Open a developer Powershell**

Hit the windows key and type "CMD". This will open a terminal window with Command Prompt. Click on the arrow next to opening a new terminal tab and select "Developer Powershell".

After opening a new Developer Powershell, enter these commands:

```powershell
cd
cd path\to\install.bat
install
```

**4. Installing Bake**

If you do not have the Bake Build System, it will prompt you if you want to install it. Choose "y" here because it's required to use this template.

**5. Rerun the install.bat in a new developer terminal**

Unfortunately, because of how Windows works, you must open a new Developer Powershell and run the same commands again.

```powershell
cd
cd path\to\install.bat
install
```

**6. Add bake to path (May not be required)**

If the commands below do not work because bake is not a valid command, add `%USERPROFILE%\bake` to your `PATH` environment variable.

**7. Make a project**

After the install finishes, create and run a project using the Raylib and Flecs Template.

```bash
bake new my_game -t RaFT
```

**8. Run your game!**

Try `bake run my_game` to see your game running.

Open a code editor, like VS Code, at your game's location and run `bake run` in the terminal.
You can also use the play button ▶ or hit `F5` to run the game.

## Build for Web

In your project, run this command to generate the JS and WASM files. You also have to download the HTML that will display the canvas. Put the HTML into the same directory as your WASM and JS files.

**For all platforms and languages**

```bash
bake --target em --cfg release-lightweight
```

[HTML Canvas](https://github.com/user-attachments/files/23412023/index.html.zip)

**Update the HTML**

Almost done, just make sure to replace every instance of "YourGame" in the HTML with the actual name of your project. You can also change the width and height on the canvas if you choose.

**Test on the Web**

This will produce an HTML file where you can run your game.

```bash
// If you have npm, use
npx http-server /path/to/game.html

// If you have python, use
// It may also be "py", "python3", or "py -3" depending on your OS
python -m http.server
```

By the way, if this is for itch.io, you have to take the HTML, JS, and WASM and compress them to a zip file. You can upload the zip file for web games on itch!

# ------ REFERENCES ------

Reference Articles:

Flecs Quickstart: https://www.flecs.dev/flecs/md_docs_2Quickstart.html

Raylib Examples: https://www.raylib.com/examples.html

Raylib CheatSheet: https://www.raylib.com/cheatsheet/cheatsheet.html

Bake Build System: https://github.com/SanderMertens/bake
