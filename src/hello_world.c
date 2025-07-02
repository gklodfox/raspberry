#include <stdio.h>
#include "pico/stdlib.h"

int main() {
    setup_default_uart();
    printf("Furry gurom!\n");
    sleep_ms(1000);
    printf("Furry furry_dolem!\n");
    sleep_ms(1000);
    return 0;
}
