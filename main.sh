# loop through all the directories in the current directory and run all "run.bash" files in them
export PROJ_PATH=~/Desktop/Codeprojects/mac-bash-commands

for dir in $PROJ_PATH/*; do
    if [ -d "$dir" ]; then

        # if run.sh exists, run it
        if [ -f "$dir/run.sh" ]; then

            echo "Executing run.sh inside $dir/run.sh"
            source $dir/run.sh
        fi
    fi
done