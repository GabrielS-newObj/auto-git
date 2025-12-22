#!/bin/bash

option=$(git branch | fzf --height 20% --layout reverse)

echo "Selected: option: $option"

option2=$(option | tr -d "* ")


echo "Selected: option: $option2"

git switch $option