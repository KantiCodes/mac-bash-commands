SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Import env-vars
. "$SCRIPT_DIR/env-vars"

# Loop through all the directories in the current directory and run all "run.bash" files in them
for dir in $PROJ_PATH/*; do
    if [ -d "$dir" ]; then

        # if run.sh exists, run it
        if [ -f "$dir/run.sh" ]; then

            source $dir/run.sh
        fi
    fi
done

