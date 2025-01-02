#!/bin/bash

echo "enter the number::"

read NUMBER

if [ "$NUMBER" -gt 100 ]
then
    echo "num is grtr"
else
    echo "num is less"
fi