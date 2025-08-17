#!/usr/bin/env fish

function cleanup_build
    if test -d build
        rm -r build
    end
end

function setup_build
    cleanup_build
    mkdir build
end

function build
    cd build
    cmake ..
    make -j4
    cd ..
end

function list_files
    echo "List files"
    find build/ -maxdepth 1 -name "*.*" -type f
end

# setup
setup_build
build
list_files
