#!/bin/bash

option=$(git branch | fzf --heigth 20% --layout reverse)

echo "Selected: option: $option"