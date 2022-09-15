export PROJ_PATH=~/Desktop/Codeprojects

goto() {
    # function cds to a certain folder under the ~/Desktop/Codeprojects/ folder
    # function takes one flag -v --venv that will decide if the virtualenv should be activated
    
    # print help if no arguments are given
    if [ $# -eq 0 ]; then
        echo """Usage: goto_code <project_name>
        -v or --venv: activate virtualenv
        -l or --list: list all projects
        """
        return 1
    fi

    # list all projects if -l or --list is given
    if [ $1 = "-l" ] || [ $1 = "--list" ]; then
        goto_list
        return 1
    fi

    cd ~/Desktop/Codeprojects/$1
    if [ "$2" = "-v" ] || [ "$2" = "--venv" ]; then
        source .venv/bin/activate
    fi
}

goto_list() {
    # function lists all projects under the ~/Desktop/Codeprojects/ folder
    cd ~/Desktop/Codeprojects
    ls
}

nano_zshenv() {
    nano ~/.zshenv
}