# NeoPixel control with C

## Project structure

repo/
├── CMakeLists.txt
├── README.md
├── src/
│   ├── main.c            # main code
│   ├── led_control.c     # LED strip control functrions
│   └── usb_comm.c        # USB communicaton functions
├── include/
│   ├── led_control.h     # declaration of LED strip control functrions
│   └── usb_comm.h        # declaration of USB communicaton functions
├── lib/                  # additional external libraries
├── tests/                # unit tests
├── scripts/              # helper scripts
