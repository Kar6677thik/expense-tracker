#!/bin/bash

# Simple Git push script

echo "Enter commit message:"
read msg

git add .
git commit -m "$msg"
git push origin master

