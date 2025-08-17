#include "pico/stdlib.h"
#include "led_control.h"

#define LED_PIN 6

int main() {
    stdio_init_all();
    led_init(LED_PIN);

    while (true) {
        led_clear();
        led_set_pixel(0, 0, 255, 0, 0);
        led_show();
        sleep_ms(500);
    }

    return 0;
}
