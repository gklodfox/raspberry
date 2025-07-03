#include <stdio.h>
#include "pico/stdlib.h"

#define TRUE 1

int main() {
    stdio_init_all();
    while(TRUE) {
        printf("Furry gurom!\n");
        sleep_ms(1000);
        printf("Furry furry_dolem!\n");
        sleep_ms(1000);
    }
    return 0;
}
