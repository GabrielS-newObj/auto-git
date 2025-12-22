#!/bin/bash

option=$(git branch | fzf \
        --height 20% \
        --layout reverse)


echo "Selected: option: $option"

option=$( echo $option | tr -d "* ")


echo "Select: option: $option"

git switch $option