# loop through all the directories in the current directory and run all "run.bash" files in them
for dir in */; do
    cd $dir
    # if run.sh exists, run it
    if [ -f "run.sh" ]; then
        # echo "Executing run.sh inside $dir"
        ./run.sh
    fi
    cd ..
done