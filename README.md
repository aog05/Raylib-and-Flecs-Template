### I do not own these libraries
_This is a template that I have made using both Raylib and Flecs libraries using the bake compiler._

_Please note that neither Raylib (https://github.com/raysan5/raylib) nor Flecs (https://github.com/SanderMertens/flecs/tree/master) belong to me. I have only created this template for ease-of-use for any developers who desire to start using Flecs and Raylib._

# ------ SETTING UP PROJECT ------
If this is your first time setting up a project, I will walk you through all of the steps for getting started.

## MacOS or Linux
**1. First, install Brew.**

If you're using MacOS or Linux you will first need to install **Brew**. Open a new terminal and run this command:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
**2. Install Git CLI**

Once that's finished, install the **GitHub CLI** (Command Line Imterface). This is what we will use to install the **bake** compiler.
```
brew install git
```
> Run `git --version` to make sure it installed correctly. The result should be something like `git version 2.49.1`.

**3. Install Bake**

Go to this link ([Bake Compiler](https://github.com/SanderMertens/bake)) and click "Code" and download the zip file.

Once downloaded, open the folder. Open a new terminal and drag and drop `setup.sh` into the terminal window. Press return (or enter) in the terminal, enter your password if asked, and close the terminal when done.

> Again, ensure it installed correctly with `bake --version`

**4. Raylib library**

Download this zip file ([Raylib Library Download](https://github.com/user-attachments/files/17270851/libraylib.a.zip)) and unzip it once it's downloaded.

Open your device root folder (for example: "Macintosh HD" in finder) then go to Users/*you*/bake/lib (or equivalent on Linux) and put this raylib library in it.

**5. Create the VS Code project**

After that last step, you're almost done. Simply, open VS Code, click _"Clone Git Repository"_, paste this link: `https://github.com/aog05/Raylib-and-Flecs-Template`, and chose a location where you would like to make this project (I just put mine in a new projects folder), and click "Open". You're done!

Click "Terminal>New Terminal" and enter `bake` then `bake run`.

If you ever want to make a new project, all you have to do is repeat step 5.

## Windows
Windows is a slightly tougher version to build for, so if there are any problems, you can report them here or on Discord.

**1. Install Git CLI**

If you haven't already download the GitHub CLI (Command Line Interface) run the command below.
```
winget install --id Git.Git -e --source winget
```
> Note: this command only works on Windows 11. Go [here](https://git-scm.com/downloads/win) for previous versions.

**2. Install Visual Studio Build Tools**

First, follow this link ([Download Bulid Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)) and go down to "Tools for Visual Studio" and click download on "Build Tools for Visual Studio" at the bottom of the selection.

Once it finishes downloading, open the Visual Studio Installer and click "Modify". After that, select "Desktop Development with C++" and click "Modify" in the bottom right. You can close the installer once it finishes installing.

**3. Install Bake**
Go to this link ([Bake Compiler](https://github.com/SanderMertens/bake)) and click "Code" and download the zip file.

Once downloaded, right-click the zip folder and click "Extract All...". open the folder. Open a new terminal, type `cd`, drag and drop the folder inside (should be called "bake-master") into the terminal window, and hit enter.
```
# The command should look like this
cd C:\Users\your_username\Downloads\bake-master\bake-master
```

Run `./setup.bat` after that.

> Again, ensure it installed correctly with `bake --version`

**4. Raylib library**

Download this zip file ([Raylib Library Download](https://github.com/user-attachments/files/17270851/libraylib.a.zip)) and unzip it once it's downloaded.

Open "File Explorer" and go to C:\Users\*you*\bake\lib and put this raylib library in it.

**5. Create the VS Code project**

After that last step, you're almost done. Simply, open VS Code, click _"Clone Git Repository"_, paste this link: `https://github.com/aog05/Raylib-and-Flecs-Template`, and chose a location where you would like to make this project (I just put mine in a new projects folder), and click "Open". You're done!

Click "Terminal>New Terminal" and enter `bake` then `bake run`.

If you ever want to make a new project, all you have to do is repeat step 5.

# ------ REFERENCES ------
Reference Articles:

Flecs Quickstart: https://www.flecs.dev/flecs/md_docs_2Quickstart.html

Raylib Examples: https://www.raylib.com/examples.html

Raylib CheatSheet: https://www.raylib.com/cheatsheet/cheatsheet.html

Bake Compiler: https://github.com/SanderMertens/bake
