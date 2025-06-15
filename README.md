### I do not own these libraries
_This is a template that I have made using both Raylib and Flecs libraries using the Bake Build System._

_Please note that neither Raylib (https://github.com/raysan5/raylib) nor Flecs (https://github.com/SanderMertens/flecs/tree/master) belong to me. I have only created this template for ease-of-use for any developers who desire to start using Flecs and Raylib._

# ------ SETTING UP THE PROJECT ------
If this is your first time setting up a project, I will walk you through all of the steps for getting started.

## MacOS or Linux
**1. First, install Brew.**

If you're using MacOS or Linux you will first need to install **Brew**. Open a new terminal and run this command:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
**2. Install Git CLI**

Once that's finished, install the **GitHub CLI** (Command Line Imterface). This is what we will use to install the **bake** Build System.
```bash
brew install git
```
> Run `git --version` to make sure it installed correctly. The result should be something like `git version 2.49.1`.

**3. Install Bake**

Go to this link ([Bake Build System](https://github.com/SanderMertens/bake)) and click "Code" and download the zip file.

Once downloaded, open the folder. Open a new terminal and drag and drop `setup.sh` into the terminal window. Press return (or enter) in the terminal, enter your password if asked, and close the terminal when done.

> Again, ensure it installed correctly with `bake --version`

**4. Raylib and Flecs Libraries**

Download this zip file [Unix Raylib Library](https://github.com/user-attachments/files/17962571/libraylib.a.zip) and unzip it once it's downloaded.

Open your device root folder (for example: "Macintosh HD" in finder) then go to Users/*you*/bake/lib (or equivalent on Linux) and put this raylib library in it.

Download the raylib source files by running,
```bash
cd
git clone https://github.com/raysan5/raylib.git
```

Download this [flecs package](https://github.com/user-attachments/files/20028357/flecs.zip), unzip it, and run:
```
cd /path/to/flecs
bake
```
> Note: if this package is moved, you have to run `bake` again.

**5. Build the Template**

Now let's build the template.

Simply open a terminal and go to a location where you would like to put the template. I will put mine into "~/bake/src/bake/templates".

Once there, run these commands:
```bash
git clone https://github.com/aog05/Raylib-and-Flecs-Template
bake Raylib-and-Flecs-Template
```

**6. Create the Project**

Go to a folder where you like this project to be. I put mine in a folder called, *"Raylib Projects"* and run this command.
```bash
bake new your_project_name -t RaFT
```

Run the program with: `bake run`.

If you ever want to make a new project, all you have to do is repeat this step.

## Windows
Windows is a slightly tougher version to build for, so if there are any problems, you can report them here or on Discord.

**1. Install Git CLI**

If you haven't already download the GitHub CLI (Command Line Interface) run the command below.
```powershell
winget install --id Git.Git -e --source winget
```
> Note: this command only works on Windows 11. Go [here](https://git-scm.com/downloads/win) for previous versions.

**2. Install Visual Studio Build Tools**

First, follow this link ([Download Bulid Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)) and go down to "Tools for Visual Studio" and click download on "Build Tools for Visual Studio" at the bottom of the selection.

Once it finishes downloading, open the Visual Studio Installer and click "Modify". After that, select "Desktop Development with C++" and click "Modify" in the bottom right. You can close the installer once it finishes installing.

**3. Install Bake**

Go to this link ([Bake Build System](https://github.com/SanderMertens/bake)) and click "Code" and download the zip file.

Once downloaded, right-click the zip folder and click "Extract All...". open the folder. Open a new terminal, type `cd`, drag and drop the folder inside (should be called "bake-master") into the terminal window, and hit enter.
```powershell
# The command should look like this
cd C:\Users\your_username\Downloads\bake-master\bake-master
```

Run `./setup.bat` after that.

> Again, ensure it installed correctly with `bake --version`

**4. Raylib and Flecs libraries**

Download this zip file ([Raylib for x32](https://github.com/user-attachments/files/18310969/raylibdll.zip) or [Raylib for x64](https://github.com/user-attachments/files/18310976/raylibdll.zip)) and unzip it once it's downloaded.

Open "File Explorer" and go to C:\Users\\*you*\bake\lib and put this raylib library in it.

Download the raylib source files by running,
```powershell
cd
git clone https://github.com/raysan5/raylib.git
```

Download this [flecs package](https://github.com/user-attachments/files/17963061/flecs.zip), unzip it, and run:
```powershell
cd \path\to\flecs
bake
```
> Note: if this package is moved, you have to run `bake` again.

**5. Build the Template**

Now let's build the template.

Simply open a terminal and go to a location where you would like to put the template. I will put mine into "~/bake/src/bake/templates".

Once there, run these commands:
```powershell
git clone https://github.com/aog05/Raylib-and-Flecs-Template
bake Raylib-and-Flecs-Template
```

**6. Create the Project**

Go to a folder where you like this project to be. I put mine in a folder called, _"Raylib Projects"_ and run this command.
```powershell
bake new your_project_name -t RaFT
```

Run the program with: `bake run`.

If you ever want to make a new project, all you have to do is repeat this step.

## Build for Web

In your existing project, run these commands for your specific platform.

**For all platforms and languages**
```powershell
bake --target em
```

**Web MacOS and Linux**

Copy and paste this at the root of your project.
```bash
emcc -o bin/game.html .bake_cache/Em-debug/obj/main.o .bake_cache/Em-debug/obj/flecs.o -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -Wunused-result --embed-file assets -Os -I ~/raylib/src -I ~/raylib/src/external -I include -I deps -s USE_GLFW=3 -s ASYNCIFY -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1 --shell-file ~/raylib/src/minshell.html ~/raylib/src/web/libraylib.a -DPLATFORM_WEB -s 'EXPORTED_FUNCTIONS=["_free","_malloc","_main"]' -s EXPORTED_RUNTIME_METHODS=ccall
```

**Web Windows**

Copy and paste this at the root of your project.
```powershell
emcc -o bin/game.html .bake_cache/Em-debug/obj/main.o .bake_cache/Em-debug/obj/flecs.o -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -Wunused-result --embed-file assets -Os -I C:/raylib/src -I C:/raylib/src/external -I include -I deps -s USE_GLFW=3 -s ASYNCIFY -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1 --shell-file C:/raylib/src/minshell.html C:/raylib/src/web/libraylib.a -DPLATFORM_WEB -s 'EXPORTED_FUNCTIONS=["_free","_malloc","_main"]' -s EXPORTED_RUNTIME_METHODS=ccall
```

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
