#!/bin/bash

# Simple script to check the Operating System

if type -t wevtutil &> /dev/null
then
    OS=MSWindows
elif type -t scutil &> /dev/null
then
    OS=MacOS
else
    OS=Linux
fi
echo $OS