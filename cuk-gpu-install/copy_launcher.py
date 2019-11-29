#!/usr/bin/env python

import subprocess
import os
import sys

command = sys.argv[1]

curr_dir = os.path.dirname(os.path.abspath(__file__))
datafile = curr_dir+"/saved_launcher.txt"

def get_current():
    get_current = subprocess.check_output(["gsettings", "get", "com.canonical.Unity.Launcher", "favorites"]).decode("utf-8")
    return (str([item for item in eval(get_current) if item.startswith("application://")]),
            [item for item in eval(get_current) if not item.startswith("application://")])

def write_saved():
    current_launcher = get_current()[0]
    with open(datafile, "w") as saved:
        saved.write(current_launcher)

def read_saved():
    with open(datafile, "r") as saved:
        return eval(saved.read())

def set_launcher():
    app_section = read_saved(); fixed_section = get_current()[1]
    new_launcher = str(app_section+fixed_section)
    subprocess.Popen(["gsettings", "set", "com.canonical.Unity.Launcher", "favorites", new_launcher ])


if command == "set":
    set_launcher()
elif command == "get":
    write_saved()
