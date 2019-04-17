#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import os
import os.path
import sys
import shutil
import subprocess
from subprocess import run, Popen, DEVNULL


def main():
    if len(sys.argv) <= 1:
        return

    if sys.argv[1] == "distccd":
        p = Popen(
            ["loadavg", "-s", os.environ["DMUCS_DISPATCHER"]],
            stdout=DEVNULL,
            stderr=DEVNULL,
        )

        return run(
            [
                "distccd",
                "--inetd",
                "--listen",
                "0.0.0.0",
                "-a",
                os.environ["DMUCS_ALLOWEDNETS"],
                *sys.argv[1:],
            ]
        )
    else:
        return run(sys.argv[1:])


if __name__ == "__main__":
    sys.exit(main())
