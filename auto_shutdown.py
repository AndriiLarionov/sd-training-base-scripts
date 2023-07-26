import os
import time
from pynput import mouse, keyboard

# Define the timeout in seconds (15 minutes)
TIMEOUT = 1 * 60

# Variables to store the last activity time
last_activity_time = time.time()

# Callback function for keyboard events
def on_press(key):
    global last_activity_time
    last_activity_time = time.time()

def on_release(key):
    global last_activity_time
    last_activity_time = time.time()

# Callback function for mouse events
def on_move(x, y):
    global last_activity_time
    last_activity_time = time.time()

def on_click(x, y, button, pressed):
    global last_activity_time
    last_activity_time = time.time()

# Start the keyboard and mouse listeners
keyboard_listener = keyboard.Listener(on_press=on_press, on_release=on_release)
keyboard_listener.start()

mouse_listener = mouse.Listener(on_move=on_move, on_click=on_click)
mouse_listener.start()

try:
    while True:
        # Check if the elapsed time since the last activity exceeds the timeout
        elapsed_time = time.time() - last_activity_time
        if elapsed_time > TIMEOUT:
            print("No user activity detected for the last 15 minutes. Shutting down...")
            # You can replace the shutdown command with any other appropriate action for your system.
            os.system("shutdown now")
            break
        time.sleep(60)  # Check for inactivity every minute

except KeyboardInterrupt:
    # Stop the listeners if the script is interrupted
    keyboard_listener.stop()
    mouse_listener.stop()
