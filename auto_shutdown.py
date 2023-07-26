import os
import time

DEFAULT_IDLE_TIME = 15 # default idle time in minutes

def get_idle_time():
    try:
        return float(os.popen('xprintidle').read()) / 1000
    except:
        return 0

def get_idle_time_from_file():
    try:
        with open("idle_time.txt", "r") as file:
            minutes = file.read().strip()
            if minutes.isdigit():
                return int(minutes) * 60
            else:
                write_default_idle_time()
                return DEFAULT_IDLE_TIME * 60
    except (FileNotFoundError, ValueError):
        write_default_idle_time()
        return DEFAULT_IDLE_TIME * 60

def write_default_idle_time():
    with open("idle_time.txt", "w") as file:
        file.write(str(DEFAULT_IDLE_TIME))

def main():
    while True:
        IDLE_TIME = get_idle_time_from_file()  # idle time in seconds
        idle_time = get_idle_time()
        print (idle_time, IDLE_TIME)
        if idle_time > IDLE_TIME:
            print('shutting down...')
            os.system('sudo shutdown now -h')
        time.sleep(60)  # check every minute

if __name__ == "__main__":
    main()
