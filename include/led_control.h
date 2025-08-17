#pragma once

#include <stdint.h>
#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"


#define LED_WIDTH   16
#define LED_HEIGHT  16
#define LED_COUNT   (LED_WIDTH * LED_HEIGHT)

void led_init(uint pin);
void led_set_pixel(int x, int y, uint8_t r, uint8_t g, uint8_t b);
void led_show(void);
void led_clear(void);
