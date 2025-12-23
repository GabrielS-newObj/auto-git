#!/bin/bash

optionCleared=$(git branch | fzf | tr -d "* ")


option=$( echo $optionCleared | fzf \
        --height 20% \
        --layout reverse \
        --border \
        --preview 'git log --oneline $( echo {} | $optionCleared)')



git switch $option