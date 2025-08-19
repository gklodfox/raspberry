#include "led_control.h"
#include "ws2812.pio.h"

static PIO pio = pio0;
static uint sm;
static uint offset;

static uint32_t leds[LED_COUNT];

static inline int xy_to_index(int x, int y) {
    if (y % 2 == 0) {
        return y * LED_WIDTH + x;
    } else {
        return y * LED_WIDTH + (LED_WIDTH - 1 - x);
    }
}

void led_init(uint pin) {
    offset = pio_add_program(pio, &ws2812_program);
    ws2812_program_init(pio, sm, offset, pin, 800000, true);
    led_clear();
    led_show();
}

void led_set_pixel(int x, int y, uint8_t r, uint8_t g, uint8_t b) {
    if (x < 0 || x >= LED_WIDTH || y < 0 || y >= LED_HEIGHT) return;
    int idx = xy_to_index(x, y);
    leds[idx] = ((uint32_t)g << 16) | ((uint32_t)r << 8) | b;  // GRB
}

void led_clear(void) {
    for (int i = 0; i < LED_COUNT; i++) leds[i] = 0;
}

void led_show(void) {
    for (int i = 0; i < LED_COUNT; i++) {
        pio_sm_put_blocking(pio, sm, leds[i] << 8u);
    }
}
