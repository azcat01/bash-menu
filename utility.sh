#!/bin/bash

# Konfirmasi setelah melakukan tindakan
function pause() {
    local message="$@"
    [ -z $message ] && message="Tekan tombol [Enter] untuk melanjutkan..."
    read -p "$message" readEnterKey
}

# Tampilan header pada pesan
function write_header() {
    local h="$@"
    clear
    echo "---------------------------------------------------------------"
    echo " ${h}"
    echo "---------------------------------------------------------------"
}

# Tampilan main menu
function show_menu() {
    echo "---------------------------"
    echo "         Main Menu"
    echo "---------------------------"
    echo "1. Who is online"
    echo "2. Simple Calculator "
    echo "3. Weather Information (Internet Required)"
    echo "4. Check Ping Server"
    echo "5. Network Information"
    echo "6. Open Youtube"
    echo "10. About Operating System"
    echo "12. Exit"
}

# Membaca inputan pengguna
function read_input() {
    local c
    read -p "Masukkan Pilihan [ 1 - 12 ] : " c
    case $c in
        1) user_info "who" ;;
        2) simple_calculator ;;
        3) show_weather ;;
        4) check_server ;;
        5) net_info ;;
        6) open_youtube ;;
        10) os_info ;;
        12) echo "Bye!"; exit 0 ;;
        *) 
        echo "Pilih antara 1 - 12 saja."
        pause
    esac
}

# Menampilkan daftar pengguna yang login
function user_info() {
    local cmd="$1"
    case "$cmd" in 
        who) write_header "        Who is online"; who -H; pause ;;
    esac 
}

# Fungsi kalkulator sederhana
function simple_calculator() {
    local num1
    local num2
    local choice
    local result

    write_header "        Simple Calculator"

    # input 2 angka
    echo "Masukkan angka pertama: "
    read num1
    echo "Masukkan angka kedua"
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

function show_weather() {
    curl -s "wttr.in/$1?m1"
    pause
}

function check_server() {
    write_header "Ping Server"
    read -p "Server Address : " addr
    ping -c3  $addr || echo "Server Dead"
    pause
}

function net_info() {
    devices=$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
    write_header " Network information "
    echo "Total network interfaces found : $(wc -w <<<${devices})"

    echo "*** IP Addresses Information ***"
    ip -4 address show

    echo "***********************"
    echo "*** Network routing ***"
    echo "***********************"
    netstat -nr

    echo "**************************************"
    echo "*** Interface traffic information ***"
    echo "**************************************"
    netstat -i

    pause 
}

function open_youtube(){
    xdg-open https://www.youtube.com/
    pause
}

function os_info() {
    write_header " System information "
    echo "Operating system : $(uname)"
    [ -x $LSB ] && $LSB -a || echo "$LSB command is not insalled (set \$LSB variable)"
    #pause "Press [Enter] key to continue..."
    pause
}

while true
    do
    clear
    show_menu
    read_input
    done