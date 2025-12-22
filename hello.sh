#!/bin/bash

option=$(git branch | fzf --height 20% --layout reverse)

echo "Selected: option: $option"

option=$({} | tr -d "* ")

git switch $option