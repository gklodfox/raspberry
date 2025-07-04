#!/usr/bin/env fish

function setup
    git remote add upstream https://github.com/raspberrypi/pico-sdk.git
    git submodule update --init --recursive
end

function cleanup_build
    if test -d build
        rm -r build
    end
    if test -f compile_commands.json
        rm compile_commands.json
    end
end

function setup_build
    cleanup_build
    mkdir build
end

function build
    cd build
    cmake .. -DACMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release Release
    make -j 4
    cd ..
end

function list_files
    echo "List files"
    find build/ -maxdepth 1 -name "*.*" -type f
end

setup
setup_build
build
list_files
