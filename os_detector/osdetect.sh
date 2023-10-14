#!/bin/bash

# Simple script to check the Operating System

if type -t wevtutil &> /dev/null
then
    # wevtutil is utility to get info about event logs on linux
    OS=MSWindows
elif type -t scutil &> /dev/null
then
    # scutil is basic command on MacOS for displaying basic network information
    OS=MacOS
else
    OS=Linux
fi
echo $OS