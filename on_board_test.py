import time
import board
import digitalio

led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT

while True:
    now = time.monotonic()
    print(f"Toggling LED at {now:.2f} seconds")
    led.value = not led.value
    time.sleep(0.5)
