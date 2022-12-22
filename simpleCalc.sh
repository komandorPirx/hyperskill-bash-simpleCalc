#!/usr/bin/env bash
#echo "Welcome to the basic calculator!"
echo "Welcome to the basic calculator!"|tee -a operation_history.txt
while true
do
    #echo "Enter an arithmetic operation or type 'quit' to quit:"
    echo "Enter an arithmetic operation or type 'quit' to quit:"|tee -a operation_history.txt
    read input_str
    echo "$input_str" >> operation_history.txt
    case "$input_str" in 
        "quit" )
        #echo "Goodbye!"
        echo "Goodbye!"|tee -a operation_history.txt
        break
        ;;
        *)
            if [[ $input_str =~ ^['-','+']*[[:digit:]]*['.']?[[:digit:]]*[' ']['-','+','*','/','^'][' '][-]*[[:digit:]]*['.']?[[:digit:]]*$ ]]; then
               # echo $((input_str))
                arithmetic_result=$(echo "scale=2; $input_str" | bc -l)
                #printf "%s\n" "$arithmetic_result"
                printf "%s\n" "$arithmetic_result"|tee -a operation_history.txt
            else
                #echo "Operation check failed!"
                echo "Operation check failed!"|tee -a operation_history.txt
            fi
         ;;   
    esac
done
