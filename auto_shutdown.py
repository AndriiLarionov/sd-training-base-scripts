import os
import time
from datetime import datetime, timedelta

IDLE_TIME = 1 * 60  # idle time in seconds

def get_idle_time():
    try:
        return float(os.popen('xprintidle').read()) / 1000
    except:
        return 0

def main():
    while True:
        idle_time = get_idle_time()
        if idle_time > IDLE_TIME:
            os.system('shutdown now -h')
        time.sleep(60)  # check every minute

if __name__ == "__main__":
    main()
