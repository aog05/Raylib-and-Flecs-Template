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
Also, run `git --version` to make sure it installed correctly. The result should be something like `git version 2.49.1`.

**3. Install Bake**

Now, we have to install **bake**. Chose a folder/directory somewhere on your computer and write `cd` in your terminal then drag and drop your folder/directory. It should look like this:
```
cd /drag/and/drop/a/directory/into/your/terminal
  ^ Remeber the space
```
This is where we will setup the bake compiler.

Once you are in that directory in your terminal, run both of these commands.
```
git clone https://github.com/SanderMertens/bake
bake/setup.sh
```
If `bake/setup.sh` doesn't work you can always run `cd bake; ./setup.sh` instead.

Again, ensure it installed correctly with:
```
bake --version
```

**4. Raylib Library**

Download this zip file ([Raylib Library Download](https://github.com/user-attachments/files/17270851/libraylib.a.zip)) and unzip it once it's downloaded.

Open your device root folder (for example: "Macintosh HD" in finder) then go to Users>*you*>bake>lib (or equivalent on Linux) and put this raylib library in it.

**5. Create the VS Code project**

After that last step, you're almost done. Simply, open VS Code, click _"Clone Git Repository"_, paste this link: `https://github.com/aog05/Raylib-and-Flecs-Template`, and chose a location where you would like to make this project (I just put mine in a new projects folder), and click "Open". You're done!

Click "Terminal>New Terminal" and enter `bake run`.

If you ever want to make a new project, all you have to do is repeat step 5.

# ------ REFERENCES ------
Reference Articles:

Flecs Quickstart: https://www.flecs.dev/flecs/md_docs_2Quickstart.html

Raylib Examples: https://www.raylib.com/examples.html

Raylib CheatSheet: https://www.raylib.com/cheatsheet/cheatsheet.html

Bake Compiler: https://github.com/SanderMertens/bake
