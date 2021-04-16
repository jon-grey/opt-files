#!/bin/bash


# Visual Code: large projects
append_line_to_file 'fs.inotify.max_user_watches = 2097152' /etc/sysctl.conf
