#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import atexit
import os
import re
import rlcompleter
from collections import *
from itertools import *

try:
    import readline
except ImportError:
    print(".pythonrc :: Module readline not available.")
else:

    readline.parse_and_bind("tab: complete")
    print(".pythonrc :: AutoCompletion Loaded")

    history_file = os.path.join(os.path.expanduser("~"), ".pyhistory")
    print(".pythonrc :: history file:", history_file)

    def save_history(history=history_file):
        import readline
        readline.write_history_file(history)
        print(".pythonrc :: history saved to " + history)

    def load_history(history=history_file):
        try:
            readline.read_history_file(history)
        except IOError:
            pass

    load_history()
    atexit.register(save_history)

    del readline, rlcompleter, atexit, history_file

# In addition to os, import some useful things
