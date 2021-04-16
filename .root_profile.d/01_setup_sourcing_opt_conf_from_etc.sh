#!/bin/bash

# change to ansible block in file
append_line_to_file 'if [ -f /opt/.profile ]; then . /opt/.profile; fi' /etc/profile
append_line_to_file 'if [ -f /opt/.bashrc ]; then . /opt/.bashrc; fi' /etc/bash.bashrc

