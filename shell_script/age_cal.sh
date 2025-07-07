#!/bin/bash

# Set both persons' names and DOBs
setVariables(){
    echo "Variables"
    NAME="vignesh"
    DOB="1999-12-21"

    name="kamal"
    dob="1998-08-18"

    _name="ram"
    _dob="2000-01-12"
}

# Function to calculate age for a given DOB
calculate_age() {
    local dob=$1
    dob_sec=$(date -d "$dob" +%s)
    now_sec=$(date +%s)
    diff_sec=$(( now_sec - dob_sec ))
    echo $(( diff_sec / (365*24*60*60) ))  # return age using echo
}

# Function to print personal info
personal(){
    local pname=$1
    local pdob=$2
    local page=$3
    
    echo "My Name           : $pname"
    echo "My Date of Birth  : $pdob"
    echo "$pname age is      : $page years"
    echo ""
}

main(){
    setVariables

    age1=$(calculate_age "$DOB")
    age2=$(calculate_age "$dob")
    age3=$(calculate_age "$_dob")

    personal "$NAME" "$DOB" "$age1"
    personal "$name" "$dob" "$age2"
    personal "$_name" "$_dob" "$age3"
}

main
