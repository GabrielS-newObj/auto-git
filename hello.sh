#!/bin/bash


option=$(git branch | fzf \
        --height 20% \
        --layout reverse \
        --border \
        --preview 'git log --oneline $(echo {} | tr -d "* ")' \
        --color bg:#222222)


git switch $option