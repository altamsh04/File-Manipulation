#!/bin/bash

print_separator() {
    echo "********|---------------------------|********"
}

print_menu_header() {
    print_separator
    echo "********| File Manipulation In Bash |********"
    print_separator
}

print_menu_options() {
    echo ""
    echo "1. Search file or directory."
    echo "2. Create or delete file or directory."
    echo "3. Get or set permission."
    echo ""
}

search_file_or_directory() {
    echo "***Search file or directory***"
    echo
    read -p "Enter File Name : " search

    if [ -f "$search" ]; then 
        echo "File exists!"
    elif [ -d "$search" ]; then
        echo "Directory exists."
    else
        echo "Not found!"
    fi
}

create_or_delete_file() {
    echo "***Create or delete file***"
    echo
    echo "1. Create file."
    echo "2. Delete file."
    read -p "Enter your choice : " ch2

    case $ch2 in 
        1)
            create_file
            ;;
        2)
            delete_file
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
}

create_file() {
    echo "***Create file***"
    echo
    read -p "Enter file name : " create

    if [ -f "$create" ]; then
        echo "File already exists!"
    else
        touch "$create"
        ls
        echo "File created!"
    fi
}

delete_file() {
    echo "***Delete file***"
    echo
    read -p "Enter file name : " delete

    if [ -f "$delete" ]; then
        rm "$delete"
        ls
        echo "File deleted!"
    else
        echo "File not found!"
    fi
}

get_or_set_permission() {
    echo "***Get or set permission***"
    echo
    echo "1. Get Permission."
    echo "2. Set Permission."
    read -p "Enter your choice : " ch3

    case $ch3 in 
        1)
            get_permission
            ;;
        2)
            set_permission
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
}

get_permission() {
    echo "***Get Permission***"
    echo
    read -p "Enter file name or directory : " per

    if [ -e "$per" ]; then
        echo "$per permission is:"
        ls -l "$per"
    else
        echo "Not found!"
    fi
}

set_permission() {
    echo "***Set Permission***"
    echo
    echo "1. Read"
    echo "2. Write"
    echo "3. Execute"
    echo "4. All"
    read -p "Enter your choice : " ch4
    echo
    read -p "Enter file name or directory : " mod

    case $ch4 in 
        1) chmod 4 "$mod"; echo "Read permission set!";;
        2) chmod 5 "$mod"; echo "Write permission set!";;
        3) chmod 7 "$mod"; echo "Execute permission set!";;
        4) chmod 777 "$mod"; echo "All permission set!";;
        *) echo "Invalid choice!";;
    esac
}

main() {
    print_menu_header
    print_menu_options
    read -p "Enter your choice (1/2/3): " ch

    case $ch in
        1) search_file_or_directory ;;
        2) create_or_delete_file ;;
        3) get_or_set_permission ;;
        *) echo "Invalid choice!" ;;
    esac
}

main
