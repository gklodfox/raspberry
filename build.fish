#!/usr/bin/env fish

function setup
    git submodule update --init --recursive
end

function cleanup_build
    if [ ! -d build ] 
        rm -r build
    end
    if [ -f compile_commands.json ]
        rm compile_commands.json
    end
end

function setup_build
    cleanup_build
    mkdir build
end

function build
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

setup
setup_build
build
list_files
copy_compile_commands
