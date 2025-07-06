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
get_total_average() {
    local marks=("$@")
    TOTAL=0
    for mark in "${marks[@]}"; do
        TOTAL=$((TOTAL + mark))
    done
    COUNT=${#marks[@]}
    AVERAGE=$((TOTAL / COUNT))
}
# Function to display result
personal() {
    local pname=$1 pdob=$2 page=$3
   
    calculate_age()
    echo "My Name           : $pname"
    echo "My Date of Birth  : $pdob"
    echo "$pname age is      : $page years"
       
}

tenth_mark()
{   local t=$1 e=$2 m=$3 s=$4 ss=$5

#    get_total_average $t $e $m $s $ss 
 

    echo "10th Marks:"
    echo " - Tamil       : $t"
    echo " - English     : $e"
    echo " - Maths       : $m"
    echo " - Science     : $s"
    echo " - Social      : $ss"
    echo " - Total       : $tenth"
    echo " - Average     : $average" 
}

tweleth_mark()
{   local t_m=$1 e_m=$2 cs_m=$3 cm_m=$4 ec_m=$5 acc_m=$6

# get_total_average $t_m $e_m $cs_m $cm_m $ec_m $acc_m
    
    echo " 12 th Marks :"
    echo " - Tamil       : $t_m"
    echo " - English     : $e_m"
    echo " - Maths       : $cs_m"
    echo " - Science     : $cm_m"
    echo " - Social      : $ec_m"
    echo " - Total       : $acc_m"
    echo " - Average     : $tweleth_averge" 

}


# Main function
main() {

    personal $1 $2 
    tenth_mark $3 $4 $5 $6 $7 
    tweleth_mark $8 $9 $10 $11 $12 $13 
    get_current_date
  
    age1=$(calculate_age "$DOB")
    age2=$(calculate_age "$dob")
 

}

main $*
