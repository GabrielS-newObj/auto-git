#!/bin/bash

#+m means the fzf command don't accept multivalue (go to more than one branch in this case)
#-m means the accept of above explication 
option=$(git branch | fzf +m\
        --height 20% \
        --layout reverse \
        --border \
<<<<<<< HEAD
        --preview 'git log --oneline $(echo {} | tr -d "* ")' \
        --color bg:#222222)
=======
        --preview \
                git log --oneline)
>>>>>>> de1ca48 (update hello.sh in screen log)





#-gt is bigger than (>) 
#-lt is less than (<)
if [ $? -gt 0 ]; then
        echo "Exiting because an error!... be carefull with commands later :)"
        exit 1
fi




git switch $option
