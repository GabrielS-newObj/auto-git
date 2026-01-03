#!/bin/bash




function avoidExitBug(){

        #-gt is bigger than (>) 
        #-lt is less than (<)
        if [ "$?" -gt 0 ]; then
                echo "Exiting because another choice!"
                exit 1
        fi
}






function switchBranch(){

        #+m means the fzf command don't accept multivalue (go to more than one branch in this case)
        #-m means accept the explication above 
        option=$(git branch | fzf +m\
                --header "---Switching branch---" \
                --height 100% \
                --layout reverse \
                --border \
                --preview 'git -c color.ui=always log --oneline $(echo {})' \
                --color bg:#222222)



        avoidExitBug

        option=$( echo $option | tr -d "* ") 

        git switch "$option"
}





function mergeBranch(){

        option=$(git branch | fzf +m \
                --header "---Merging branch---" \
                --height 100% \
                --layout reverse \
                --border \
                --preview 'git -c color.ui=always diff $(echo {})' \
                --color bg:#222222)



        avoidExitBug

        option=$( echo $option | tr -d "* ") 

        git merge "$option"
}





function deleteBranch(){

        option=$(git branch | fzf +m \
                --header "---Deleting branch---" \
                --height 100% \
                --layout reverse \
                --border \
                --preview 'git -c color.ui=always log --oneline $(echo{})' \
                --color bg:#222222)


        
        avoidExitBug

        option=$( echo $option | tr -d "* ")


        git branch -d "$option"
}





function main(){

        menu=(\
                "1 - switch branch" \
                "2 - merge branch" \
                "3 - delete branch" \
                "Exit"\
        )


        selected=$(\
                for i in "${menu[@]}" ; \
                do echo $i; \
                done | fzf +m \
                --height 100% \
                --layout reverse \
                --border \
                --color bg:#222222)



        avoidExitBug




        case "$selected" in
                "${menu[0]}")
                        switchBranch
                        exit 0
                ;;

                "${menu[1]}")
                        mergeBranch
                        exit 0
                ;;

                "${menu[2]}")
                        deleteBranch
                        exit 0
                ;;

                "${menu[3]}")
                        echo "Bye! See you later :)..."
                        exit 0
                ;;

                *)
                        echo "Exiting with no option!"
                        exit 0
                ;;
        

        esac

}



function isAGitRepository(){

    git status >> /dev/null 2>&1

    if [ "$?" -eq 128 ]; then
        echo "this is not a git repository"
        exit 1
    fi

}



function isAGitRepository(){
        
         git status >> /dev/null 2>&1
         
         if [ "$?" -eq 128 ]; then 
                 echo "this is not a git repository"
                 exit 0
         fi
}





isAGitRepository

main
