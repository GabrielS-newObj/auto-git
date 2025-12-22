#!/bin/bash

option=$(git branch | fzf --height 20% --layout reverse)

echo "Selected: option: $option"

option=$({} | tr -d "* ")


echo "Selected: option: $option"

git switch $option