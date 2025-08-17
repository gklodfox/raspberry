cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(PROJECT_NAME raspberry_pico_led_matrix)
set(PICO_SDK_PATH /home/fox/Sources/pico-sdk)

include(pico_sdk_import.cmake)

project(${PROJECT_NAME} C CXX ASM)

if(PICO_SDK_VERSION_STRING VERSION_LESS "2.2.0")
  message(
    FATAL_ERROR
      "Raspberry Pi Pico SDK version 2.2.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}"
  )
endif()

pico_sdk_init()

add_compile_options(
  -Wall -Wno-format # int != int32_t as far as the compiler is concerned because
                    # gcc has int32_t as long int
  -Wno-unused-function # we have some for the docs that aren't called
)
if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
  add_compile_options(-Wno-maybe-uninitialized)
endif()

add_executable(${PROJECT_NAME} src/main.c src/led_control.c)

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_LIST_DIR}/include)

pico_generate_pio_header(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/ws2812.pio)

pico_set_program_name(${PROJECT_NAME} "WS2812 Example")
pico_set_program_version(${PROJECT_NAME} "1.0")

pico_enable_stdio_usb(${PROJECT_NAME} 1)
pico_enable_stdio_uart(${PROJECT_NAME} 0)

target_link_libraries(${PROJECT_NAME} pico_stdlib hardware_pio)

pico_add_extra_outputs(${PROJECT_NAME})
