import os
import time
import pyautogui

# Define the timeout in seconds (15 minutes)
MINUTES = 1
TIMEOUT = MINUTES * 60

# Function to check for inactivity
def check_for_inactivity():
    last_activity_time = time.time()
    while True:
        # Check if the elapsed time since the last activity exceeds the timeout
        elapsed_time = time.time() - last_activity_time
        if elapsed_time > TIMEOUT:
            print(f"No user activity detected for the last ${MINUTES} minutes. Shutting down...")
            # You can replace the shutdown command with any other appropriate action for your system.
            os.system("shutdown now")
            break

        try:
            # Check for user activity using pyautogui
            pyautogui.moveRel(1, 0)
        except pyautogui.FailSafeException:
            # pyautogui.FailSafeException is raised if the mouse is moved to (0, 0) coordinates.
            pass
        last_activity_time = time.time()
        time.sleep(60)  # Check for inactivity every minute

if __name__ == "__main__":
    check_for_inactivity()