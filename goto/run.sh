goto() {
    # function cds to a certain folder under the ~/Desktop/Codeprojects/ folder
    # function takes one flag -v --venv that will decide if the virtualenv should be activated
    
    # print help if no arguments are given
    if [ $# -eq 0 ]; then
        cd "$GOTO_PATH"
        return 1
    fi

    if [ $1 = "-h" ] || [ $1 = "--help" ]; then
        echo """Usage: goto_code <project_name>
        -v or --venv: activate virtualenv
        -l or --list: list all projects
        """
        return 1
    fi

    if [ $1 = "-l" ] || [ $1 = "--list" ]; then
        goto_list
        return 1
    fi
    cd "$GOTO_PATH/$1"
    if [ "$2" = "-v" ] || [ "$2" = "--venv" ]; then
        source .venv/bin/activate
    fi
}

goto_list() {
    cd "$GOTO_PATH"
    ls
}

nano_zshenv() {
    nano ~/.zshenv
}