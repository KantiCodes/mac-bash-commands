# mac-bash-commands
My prviate helpers method for mac

# Installation:
 - setup environmental variables inside env-vars file, for example:
    * PROJ_PATH=~/Desktop/Projects/mac-bash-commands  # Location where you cloned the repo
    * GOTO_PATH=~/Desktop/Projects/  # Default Directory of goto function with all of you repositories
 - "To use my tool, please add the following line to your ```~/.zprofile``` file:
 
   ```source /path/to/my/tool.sh```

    This will allow you to access the tool's functionality from your terminal. Please note that you can also add this line to other shell initialization files such as ```.zshenv``` or ```.bashrc```, depending on your preference and setup.

   *It's important to note that .zshenv, .zprofile, and other shell initialization files are used by the shell to set up the environment and define various system and user settings. While it's beyond the scope of this readme to explain each file in detail, I encourage you to read more about them and their purpose. By doing so, you can gain a better understanding of how your shell environment is set up and configured.*


# goto
project navigator that allows you to quickly navigate to one of your repositories inside GOTO_PATH

# python-venv
Helper aliasing some of the boilerplate commands when handling python environments

Examples:
- ```pvenv -m 3.10``` will run:

  ```
  python3.10 -m venv .venv:
  source .venv/bin/activate
  python -m pip install pip-tools
  ```

- ```pvenv -if/--install-file``` will run:

  ```
  python -m pip install -r requirements.txt
  ```
  
- ```pvenv -if something/requirements.txt```

  ```
    python -m pip install -r something/requirements.txt

  ```



