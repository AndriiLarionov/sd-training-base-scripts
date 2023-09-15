import os
import time

DEFAULT_IDLE_TIME = 15 # default idle time in minutes

file_path = os.path.join(os.environ['HOME'], 'idle_time.txt')

def get_idle_time():
    try:
        return float(os.popen('xprintidle').read()) / 1000
    except:
        return 0

def get_idle_time_from_file():
    try:
        with open(file_path, "r") as file:
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
    with open(file_path, "w") as file:
        file.write(str(DEFAULT_IDLE_TIME))
    os.system('bash $HOME/sd-training-base-scripts/src/create_idle_time_shortcut.sh')

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
