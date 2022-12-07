#!/bin/bash

function pause(){
    local message="$@"
    [ -z $message ] && message="Press [Enter] key to continue..."
    read -p "$message" readEnterKey
}

# Tampilan main menu
function show_menu(){
    echo "---------------------------"
    echo " Main Menu"
    echo "---------------------------"
    echo "1. Who is online"
    echo "12. Exit"
}

# Tampilan header pada pesan
function write_header(){
    local h="$@"
    echo "---------------------------------------------------------------"
    echo " ${h}"
    echo "---------------------------------------------------------------"
}

# Menampilkan daftar pengguna yang login
function user_info(){
    local cmd="$1"
    case "$cmd" in 
    who) write_header " Who is online "; who -H; pause ;;
    esac 
}

function read_input(){
    local c
    read -p "Masukkan Pilihan [ 1 - 12 ] : " c
    case $c in
    1) user_info "who" ;;
    12) echo "Bye!"; exit 0 ;;
    *) 
    echo "Pilih antara 1 - 12 saja."
    pause
    esac
}

while true
    do
    clear
    show_menu
    read_input
    done