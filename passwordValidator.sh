#!/usr/bin/bash
#Simple PASSWORD Generator

# ---------------------------------------------------
# -eq # Equal
# -ne # Not equal
# -lt # Less than
# -le # Less than or equal
# -gt # Greater than
# -ge # Greater than or equal
# ----------------------------------------------------

valid=true
NUM_REQUIRED=10
green='\033[0;32m'
red='\033[0;31m'
MESSAGE1="Your password must contain minimum 10 characters, "
MESSAGE2="Your password must contain both alphabet and number, "
MESSAGE3="Your password must include both loweer case and upper case letters"
RESULT=""
echo "Hey dear user, we will check if your PASSWORD is valid."
echo "Please write your PASSWORD: "
read PASSWORD
PASSWORD_leangth=${#PASSWORD}
# # echo $PASSWORD_leangth

# # PASSWORD contain minimum 10 characters              Working
if  [[ $PASSWORD_leangth -ge $NUM_REQUIRED ]]; then
    valid=true
else
    valid1=false
    RESULT="$MESSAGE1"
fi

# ## Contain both alphabet and number.                    Working
if [[ $PASSWORD == *[[:digit:]]* ]] &&
   [[ $PASSWORD == *[[:alpha:]]* ]]
then
    valid=true
else
    valid2=false
    RESULT="$MESSAGE1$MESSAGE2"
fi

# ## Include both the small and capital case letters.      Working
if  [[ $PASSWORD == ${PASSWORD,,} ]] ||
    [[ $PASSWORD == ${PASSWORD^^} ]]; then
        valid3=false
else
        valid=true
        RESULT="$MESSAGE1$MESSAGE2$MESSAGE3"

fi

if [[ $valid1 == true && $valid2 == true && $valid3 == false  ]]; then
   echo -e "Your password is valid! ${green} ${PASSWORD} ${clear}!"
else
   echo -e "Your password is NOT valid! ${red} ${PASSWORD} !"
   echo $RESULT
fi

