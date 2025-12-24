#!/bin/bash




function avoidExitBug(){
        #-gt is bigger than (>) 
        #-lt is less than (<)
        if [ $? -gt 0 ]; then
                echo "Exiting because an error!... be carefull with commands later :)"
                exit 1
        fi
}






function switchBranch(){

        #+m means the fzf command don't accept multivalue (go to more than one branch in this case)
        #-m means accept the explication above 
        option=$(git branch | fzf +m\
                --height 20% \
                --layout reverse \
                --border \
                --preview 'git -c color.ui=always log --oneline $(echo {})' \
                --color bg:#222222)



        avoidExitBug



        git switch $option
}





function mergeBranch(){
        option=$(git branch | fzf +m \
                --height 80% \
                --layout reverse \
                --border \
                --preview 'git -c color.ui=always diff $(echo {})' \
                --color bg:#222222)


        avoidExitBug



        echo "continue merging <$option> overwriting <$(git branch | grep "^*")>? (y/n)"
        

        result=$?
        if [$result -eq "n"]; then {
                exit 0
        }
        elif [$result -eq "y"]; then {
                git merge $option
        }
        else {
                echo "unknown option :("
                echo "try again!"
        }

}



mergeBranch

