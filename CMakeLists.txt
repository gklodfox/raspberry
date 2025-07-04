cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(PICO_SDK_PATH ${CMAKE_CURRENT_LIST_DIR}/pico-sdk)

include(pico_sdk_import.cmake)

project(hello_world)

pico_sdk_init()

add_executable(hello_world
    src/hello_world.c
)

target_link_libraries(hello_world pico_stdlib)

pico_enable_stdio_usb(hello_world 1)
pico_enable_stdio_uart(hello_world 0)

pico_add_extra_outputs(hello_world)
