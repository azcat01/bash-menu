#!/bin/bash

function pause(){
    local message="$@"
    [ -z $message ] && message="Press [Enter] key to continue..."
    read -p "$message" readEnterKey
}

# Tampilan main menu
function show_menu(){
    echo "---------------------------"
    echo "         Main Menu"
    echo "---------------------------"
    echo "1. Who is online"
    echo "2. Simple Calculator"
    echo "12. Exit"
}

# Tampilan header pada pesan
function write_header(){
    local h="$@"
    clear
    echo "---------------------------------------------------------------"
    echo " ${h}"
    echo "---------------------------------------------------------------"
}

# Menampilkan daftar pengguna yang login
function user_info(){
    local cmd="$1"
    case "$cmd" in 
    who) write_header "        Who is online"; who -H; pause ;;
    esac 
}

function read_input(){
    local c
    read -p "Masukkan Pilihan [ 1 - 12 ] : " c
    case $c in
    1) user_info "who" ;;
    2) simple_calculator ;;
    12) echo "Bye!"; exit 0 ;;
    *) 
    echo "Pilih antara 1 - 12 saja."
    pause
    esac
}

function simple_calculator() {
    local num1
    local num2
    local choice
    local result

    write_header "        Simple Calculator"

    # input 2 angka
    echo "Masukkan 2 angka : "
    read num1
    read num2
    
    # input operasi perhitungan 
    echo "Operasi Perhitungan :"
    echo "1. Penjumlahan"
    echo "2. Pengurangan"
    echo "3. Perkalian"
    echo "4. Pembagian"
    echo -n "Masukkan pilihan [1 - 4] : "
    read choice
    
    # switch case perhitungan
    case $choice in
        1)result=$(expr $num1 + $num2) ;;
        2)result=$(expr $num1 - $num2) ;;
        3)result=$(expr $num1 \* $num2) ;;
        4)result=$(expr $num1 / $num2) ;;
        *)
        echo "Hanya pilih 1 - 4!" ;;
    esac
                                                            
    echo -n "Hasil perhitungan --> "
    echo $result
    pause
}

while true
    do
    clear
    show_menu
    read_input
    done