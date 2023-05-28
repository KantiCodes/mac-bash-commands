export errorText="Something went wrong"
pvenv () {
    pmake () {
        if [ $# = 0 ]; then
        echo "making 3.8 venv"
        python3.8 -m venv $VENV_ALIAS

        elif [ $1 = "39" ] || [ $1 = "3.9" ]; then
        echo "making 3.9 venv"
        python3.9 -m venv $VENV_ALIAS

        elif [ $1 = "310" ] || [ $1 = "3.10" ]; then
        echo "making 3.10 venv"
        python3.10 -m venv $VENV_ALIAS

        else
        echo "Error: pmake: python version not found"
        return 0
        fi
        
        echo "activating venv"
        source $VENV_ALIAS/bin/activate
        echo "installing pip-tools"
        python -m pip install pip-tools
    }

    if [ $# = 0 ] || [ $1 = "-h" ] || [ $1 = '--help' ]; then
        echo "This is a tool for managing python environment"
        echo "options:"

        echo "  -h --help: print this help message"

        echo "  -a --activate: activate the virtualenv"

        echo "  -d --deactivate: deactivate the virtualenv"

        echo "  -r --remove: remove the virtualenv"

        echo "  -c --compile [requirements file]: compile the requirements file\n   - default: requirements.in"

        echo "  -if --install-file [requirements file]: install requirements\n    - default: requirements.txt"

        echo "  -i --install [package name]: install package"

        echo "  -u --uninstall [package name]: uninstall package"

        echo "  -m --make [python version]: make a virtualenv with python version; default3.8
    available versions:
    - 3.8 or 38
    - 3.9 or 39
    - 3.10 or 3.10"
        return 0
    fi

    case $1 in
        "-m" | "--make") pmake ${@:2}; return;;
        "-a" | "--activate") source $VENV_ALIAS/bin/activate; return;;
        "-r" | "--remove") remove_venv; return;;
    esac


    # All the commands below need to have venv activated
    if ! check_venv;
    then
        echo "Error: venv needs to be activated to exectute this action"
        return 1
    fi

    case $1 in
        "-d" | "--deactivate") deactivate; return;;
        "-c" | "--compile") compile_file $2; return;;
        "-if" | "--install-file") install_file $2; return;;
        "-i" | "--install") install_package $2; return;;
        "-u" | "--uninstall") uninstall_package $2; return;;

    esac

    echo "Unknown command $1"

}
remove_venv() {
    deactivate
    rm -rf $VENV_ALIAS
}

compile_file() {
    local filePath=$1
    local defaultPath="requirements.in"
    if [ $# = 0 ]; then
        echo "Using default path: $defaultPath"
        filePath=$defaultPath
    fi
    python -m piptools compile -r $filePath && return 0 || return 1
}

install_file() {
    local filePath=$1
    local defaultPath="requirements.txt"
    if [ $# = 0 ]; then
        echo "Using default path: $defaultPath"
        filePath=$defaultPath
    fi
    python -m pip install -r $filePath && return 0 || return 1

}

install_package() {
    if [ $# = 1 ]; then
        python -m pip install $1 && return 0 || echo "Error: install package missing [package name] argument"; return 1
    fi
}

uninstall_package() {
    if [ $# = 1 ]; then
        python -m pip uninstall $1 && return 0 || echo "Error: uninstall package missing [package name] argument"; return 1
    fi
}

check_venv(){
    python --version > /dev/null 2>&1 && return 0 || return 1
}