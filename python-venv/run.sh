pvenv () {
    pmake () {
        if [ $# = 0 ]; then
        echo "making 3.8 venv"
        python3.8 -m venv .venv

        elif [ $1 = "39" ] || [ $1 = "3.9" ]; then
        echo "making 3.9 venv"
        python3.9 -m venv .venv
        fi
        
        echo "activating venv"
        source .venv/bin/activate
        echo "installing pip-tools"
        python -m pip install pip-tools
    }

    if [ $# = 0 ] || [ $1 = "-h" ] || [ $1 = '--help' ]; then
        echo "options:"
        echo "-h --help: print this help message"
        echo "-a --activate: activate the virtualenv"
        echo "-d --deactivate: deactivate the virtualenv"
        echo "-r --remove: remove the virtualenv"
        echo "-c --compile: compile the \$2 or requirements.in file"
        echo "-i --install: install the \$2 or requirements.txt file"
        echo "-m --make: make a virtualenv with python version \$2 or 3.8"
        return 1
    fi

    if [ $1 = "-m" ] || [ $1 = "--make" ]; then
        # call pmake with all but the first arugments
        pmake ${@:2}
    fi

    # activate
    if [ $1 = "-a" ] || [ $1 = "--activate" ]; then
        source .venv/bin/activate
        return 1
    fi

    # deactivate
    if [ $1 = "-d" ] || [ $1 = "--deactivate" ]; then
        deactivate
        return 1
    fi

    # remove
    if [ $1 = "-r" ] || [ $1 = "--remove" ]; then
        rm -rf .venv
        return 1
    fi

    # compile
    if [ $1 = "-c" ] || [ $1 = "--compile" ]; then
        if [ $# = 2 ]; then
            python -m piptools compile -r $2
            return 1
        fi
        python -m piptools compile -r requirements.in
        return 1
    fi

    # compile
    if [ $1 = "-i" ] || [ $1 = "--install" ]; then
        if [ $# = 2 ]; then
            python -m pip install -r $2
            return 1
        fi
        python -m pip install -r requirements.txt
        return 1
    fi

}