import board
import neopixel
from time import sleep
from random import choice

PIN = board.GP0
num_pix = 6 #Number of LEDs
# Define our light string object
pixels = neopixel.NeoPixel(PIN, num_pix, brightness=0.4, auto_write=False)

# Try just setting every light to a equal chance of
#  black, red, yellow, orange, black, half-red, half-yellow and half-orange 
while True:
    for x in range(0, num_pix):
        # Black, Red, Yellow or Orange
        r = choice([(0,0,0), (255,0,0), (255,255,0), (255,165,0),
                (150,0,0), (165,78,0), (0,0,0), (165,165,0)])
        pixels[x] = r
    sleep(0.1)
    pixels.show()
