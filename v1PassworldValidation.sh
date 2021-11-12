#!/usr/bin/bash

echo "Dear $(whoami), please enter your password for us to validate it's strength: "
read PASSWORD;
echo $PASSWORD
PASSWORD_LEANGTH=${#PASSWORD}
echo $PASSWORD_LEANGTH
MIN_REQUERD=10
valid=true

## Contain both alphabet and number
if [[ $PASSWORD_LEANGTH -le $MIN_REQUERD ]]; then
    # valid=false
    # echo "Dear $whoami, your password must contain minimum of 10 characters"
    # echo "Please try again"
    # break
fi

## Contain both alphabet and number
if [[ $PASSWORD -ne *[[:digit:]]* ]] &&
   [[ $PASSWORD -ne *[[:alpha:]]* ]]; then
    valid=false
    RESULT="Your password must contain both alphabet and number \n"
fi

## Include both the small and capital case letters.      
if  [[ $PASSWORD -ne ${PASSWORD,,} ]] ||
    [[ $PASSWORD -ne ${PASSWORD^^} ]]; then
        valid=false
        RESULT="Your password must include both loweer case and upper case letter "
        break
fi

