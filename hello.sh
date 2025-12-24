#!/bin/bash




function avoidExitBug(){
        #-gt is bigger than (>) 
        #-lt is less than (<)
        if [ "$?" -gt 0 ]; then
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



        
        now=$(git branch | grep "^* " | tr -d "* ")


        echo "continue merging <$now> overwriting by <$option>? (1 for yes/0 for no)"
        read   


        result=$($? | tr -d " ")

        if [0 -eq 0]; then 
                exit 0
        
        elif [$result -eq '1']; then 
                git merge "$option"

        else 
                echo "unknown option :("
                echo "try again! (1 or 0 only)"
        fi

}



mergeBranch

