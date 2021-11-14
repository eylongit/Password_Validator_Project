# #!/usr/bin/bash
# #Simple PASSWORD Generator

valid=true
NUM_REQUIRED=9
green='\033[0;32m'
red='\033[0;31m'
reset='\u001b[0m'
NL=$'\n'
RESULT=""
echo "Hey dear user, we will check if your PASSWORD is valid."
echo "Please write your PASSWORD: "
read PASSWORD
PASSWORD_leangth=${#PASSWORD}

# PASSWORD contain minimum 10 characters              Working
if  [[ $PASSWORD_leangth -le $NUM_REQUIRED ]]; then
    valid=false
    RESULT1="ERROR = Dear $(whoami), your password must contain minimum 10 characters${NL}" 
fi


## Contain both alphabet and number.                    Working
if  [[ "$PASSWORD" =~ [a-zA-Z] ]] && [[ "$PASSWORD" =~ [0-9] ]]; then
        :
else
        valid=false
        RESULT2="ERROR = Dear $(whoami), your Password must contain numric AND alpha${NL}" 
fi


## Include both the small and capital case letters.      Working
if  [[ $PASSWORD == ${PASSWORD,,} ]] ||
    [[ $PASSWORD == ${PASSWORD^^} ]]; then
        valid=false
        RESULT3="ERROR = Dear $(whoami), your password must contain uppercase AND lowercase letters in the password${NL} " 
fi

if [[ $valid == true  ]]; then
   echo -e "Your password is valid! ${green} ${PASSWORD} ${clear}!"
else
   echo -e "Your password is NOT valid! ${red} ${PASSWORD} ${reset} !"
   echo -e "$RESULT1\n$RESULT2\n$RESULT3"
fi
