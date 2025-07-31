function rsd -d "Run command in every subdirectory"
    for dir in */
        if test -d $dir
            echo "=== Running in $dir ==="
            pushd $dir
            eval $argv
            popd
        end
    end
end
