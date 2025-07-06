#!/bin/bash

# Function to get current date components
get_current_date() {
    current_year=$(date +%Y)
    current_mmdd=$(date +%m%d)
}

# Function to calculate age accurately
calculate_age() {
    local dob=$1

    birth_year=$(date -d "$dob" +%Y)
    birth_mmdd=$(date -d "$dob" +%m%d)

    local age=$(( current_year - birth_year))

    if [ "$current_mmdd" -lt "$birth_mmdd" ]; then
        age=$((age - 1))
    fi
    echo "$age"
}

# Function to calculate total and average

get_total_average(){
         marks=$@
        #  echo $marks $#
        # local marks=("$@")
        TOTAL=0
        # ${marks[@]}
        for mark in `echo $marks`
        do
            TOTAL=$((TOTAL +mark))
        done
        
        COUNT=$#
        AVERAGE=$((TOTAL /COUNT))
}
# Function to display personal info
personal() {
  
    get_current_date
   local page=$(calculate_age "$DOB")

    echo "My Name           : $NAME"
    echo "My Date of Birth  : $DOB"
    echo "$NAME age is      : $page years"
    echo
}

tenth_mark() {
  
     get_total_average $SSLC_TAMIL $SSLC_ENG $SSLC_MATHS $SSLC_SCIENCE $SSLC_SS

   
    echo "10th Marks:"
    echo " - Tamil       : $SSLC_TAMIL"
    echo " - English     : $SSLC_ENG"
    echo " - Maths       : $SSLC_MATHS"
    echo " - Science     : $SSLC_SCIENCE"
    echo " - Social      : $SSLC_SS"
    echo " - Total       : $TOTAL"
    echo " - Average     : $AVERAGE"
    echo

}

tweleth_mark() {
   
    get_total_average $HSC_TAMIL $HSC_ENG $HSC_CS $HSC_COMM $HSC_ECO $HSC_ACC
   
    echo "12th Marks:"
    echo " - Tamil       : $HSC_TAMIL"
    echo " - English     : $HSC_ENG"
    echo " - Computer    : $HSC_CS"
    echo " - Commerce    : $HSC_COMM"
    echo " - Economics   : $HSC_ECO"
    echo " - Accountancy : $HSC_ACC"
    echo " - Total       : $TOTAL"
    echo " - Average     : $AVERAGE"
    echo

}

# Main function
main() {

    WORK_DIR=`pwd`
    dir=$1
    file_count=0

    if [ -d "$dir" ]
    then
     for file in `find $dir -iname "*.txt"` 
     do
         echo $file
        if [ -f "$file" ]; 
        then
           echo " Reading from: $file"
            . $WORK_DIR/$file
            echo $?
            # exit 1
             file_count ++
        fi

    done   
    else
        echo "File Does Not Exist "
        exit 1
    fi 
   
   echo "File Count is : $file_count " 
  

    personal    
    tenth_mark   
    tweleth_mark 

    
   
}

 main "$@"

 # read name dob t10 e10 m10 sci10 soc10 t12 e12 cs comm econ acc < students.txt
   
    # personal    "$name" "$dob"
    # tenth_mark   "$t10" "$e10" "$m10" "$sci10" "$soc10"
    # tweleth_mark "$t12" "$e12" "$cs" "$comm" "$econ" "$acc"

    # while read -r name dob t10 e10 m10 sci10 soc10 t12 e12 cs comm econ acc ; do
   
    # personal "$name" "$dob"
    # tenth_mark "$t10" "$e10" "$m10" "$sci10" "$soc10"
    # tweleth_mark "$t12" "$e12" "$cs" "$comm" "$econ" "$acc"
   
    # done < "$file"
