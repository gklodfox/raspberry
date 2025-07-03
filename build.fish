#!/usr/bin/env fish

function cleanup_build
    echo "Cleanup build directory"
    if [ ! -d build ] 
        rm -r build
    end
end

function setup_build
    echo "Setup build directory"

    cleanup_build

    mkdir build
end

function build
    echo "Build application"

    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j 4
    cd ..
end

function list_files
    echo "List files"
    find build/ -maxdepth 1 -name "*.*" -type f
end

function copy_compile_commands
    echo "Copy compile_commands.json"
    cp build/compile_commands.json .
end

setup_build
build
list_files
copy_compile_commands
