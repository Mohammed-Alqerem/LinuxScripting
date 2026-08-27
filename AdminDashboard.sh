#!/bin/bash

mkdir -p reports
mkdir -p backups


pause() {
    echo
    read -r -p "Press Enter to continue..."
}


system_info() {
    clear

    echo "===== System Information ====="
    echo

    echo "Current User:"
    whoami

    echo
    echo "Hostname:"
    hostname

    echo
    echo "Current Directory:"
    pwd

    echo
    echo "Date:"
    date

    echo
    echo "Disk Usage:"
    df -h

    pause
}


users_info() {
    clear

    echo "===== Users and Groups ====="
    echo
    echo "1. Show all users"
    echo "2. Show all groups"
    echo "3. Search for user"
    echo

    read -r -p "Choose: " c

    case "$c" in

        1)
            echo
            cut -d ':' -f1 /etc/passwd
            ;;

        2)
            echo
            cut -d ':' -f1 /etc/group
            ;;

        3)
            echo
            read -r -p "Enter username: " u

            if [ "$u" = "" ]
            then
                echo "Username cannot be empty"
            else
                grep "$u" /etc/passwd

                if [ $? -eq 0 ]
                then
                    echo "User found"
                else
                    echo "User not found"
                fi
            fi
            ;;

        *)
            echo "Invalid option"
            ;;

    esac

    pause
}


file_manager() {
    clear

    echo "===== File Manager ====="
    echo
    echo "1. Create file"
    echo "2. Create directory"
    echo "3. Delete file"
    echo "4. Copy file"
    echo "5. List directory"
    echo

    read -r -p "Choose: " c

    case "$c" in

        1)
            read -r -p "Enter file name: " f

            if [ "$f" = "" ]
            then
                echo "File name cannot be empty"

            elif [ -f "$f" ]
            then
                echo "File already exists"

            else
                touch "$f"

                if [ $? -eq 0 ]
                then
                    echo "File created"
                else
                    echo "Error creating file"
                fi
            fi
            ;;

        2)
            read -r -p "Enter directory name: " d

            if [ "$d" = "" ]
            then
                echo "Directory name cannot be empty"

            elif [ -d "$d" ]
            then
                echo "Directory already exists"

            else
                mkdir "$d"

                if [ $? -eq 0 ]
                then
                    echo "Directory created"
                else
                    echo "Error creating directory"
                fi
            fi
            ;;

        3)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                rm "$f"

                if [ $? -eq 0 ]
                then
                    echo "File deleted"
                else
                    echo "Could not delete file"
                fi
            else
                echo "File not found"
            fi
            ;;

        4)
            read -r -p "Enter source file: " f

            if [ -f "$f" ]
            then
                read -r -p "Enter destination: " d

                if [ "$d" = "" ]
                then
                    echo "Destination cannot be empty"
                else
                    cp "$f" "$d"

                    if [ $? -eq 0 ]
                    then
                        echo "File copied"
                    else
                        echo "Copy failed"
                    fi
                fi
            else
                echo "File not found"
            fi
            ;;

        5)
            read -r -p "Enter directory: " d

            if [ -d "$d" ]
            then
                ls -l "$d"
            else
                echo "Directory not found"
            fi
            ;;

        *)
            echo "Invalid option"
            ;;

    esac

    pause
}


permissions() {
    clear

    echo "===== Permissions ====="
    echo
    echo "1. Check file permissions"
    echo "2. Change file permissions"
    echo "3. Add execute permission"
    echo

    read -r -p "Choose: " c

    case "$c" in

        1)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                ls -l "$f"
            else
                echo "File not found"
            fi
            ;;

        2)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                read -r -p "Enter permission (example 644): " p

                chmod "$p" "$f"

                if [ $? -eq 0 ]
                then
                    echo "Permission changed"
                    ls -l "$f"
                else
                    echo "Invalid permission"
                fi
            else
                echo "File not found"
            fi
            ;;

        3)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                chmod u+x "$f"

                echo "Execute permission added"
                ls -l "$f"
            else
                echo "File not found"
            fi
            ;;

        *)
            echo "Invalid option"
            ;;

    esac

    pause
}


text_tools() {
    clear

    echo "===== Text Processing ====="
    echo
    echo "1. Search text"
    echo "2. Count lines"
    echo "3. Sort file"
    echo "4. Remove duplicate lines"
    echo "5. Convert to uppercase"
    echo

    read -r -p "Choose: " c

    case "$c" in

        1)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                read -r -p "Enter word: " w

                grep "$w" "$f"

                if [ $? -eq 0 ]
                then
                    echo "Text found"
                else
                    echo "Text not found"
                fi
            else
                echo "File not found"
            fi
            ;;

        2)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                wc -l "$f"
            else
                echo "File not found"
            fi
            ;;

        3)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                sort "$f"
            else
                echo "File not found"
            fi
            ;;

        4)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                sort "$f" | uniq
            else
                echo "File not found"
            fi
            ;;

        5)
            read -r -p "Enter file name: " f

            if [ -f "$f" ]
            then
                cat "$f" | tr 'a-z' 'A-Z'
            else
                echo "File not found"
            fi
            ;;

        *)
            echo "Invalid option"
            ;;

    esac

    pause
}


report() {
    clear

    f="reports/system_report.txt"

    echo "LINUX SYSTEM REPORT" > "$f"
    echo "==============================" >> "$f"

    echo "Date:" >> "$f"
    date >> "$f"

    echo >> "$f"

    echo "User:" >> "$f"
    whoami >> "$f"

    echo >> "$f"

    echo "Hostname:" >> "$f"
    hostname >> "$f"

    echo >> "$f"

    echo "Disk Usage:" >> "$f"
    df -h >> "$f"

    echo >> "$f"

    echo "Number of Users:" >> "$f"
    cut -d ':' -f1 /etc/passwd | sort | uniq | wc -l >> "$f"

    echo
    echo "Report created:"
    echo "$f"

    pause
}


backup() {
    clear

    echo "===== Backup ====="
    echo

    read -r -p "Enter file name: " f

    if [ -f "$f" ]
    then
        read -r -p "Enter backup name: " n

        if [ "$n" = "" ]
        then
            echo "Backup name cannot be empty"
        else
            cp "$f" "backups/$n"

            if [ $? -eq 0 ]
            then
                echo "Backup created"
            else
                echo "Backup failed"
            fi
        fi
    else
        echo "File not found"
    fi

    pause
}


while true
do
    clear

    echo "=================================="
    echo "      LINUX ADMIN DASHBOARD"
    echo "=================================="
    echo
    echo "1. System Information"
    echo "2. Users and Groups"
    echo "3. File Manager"
    echo "4. Permissions"
    echo "5. Text Processing"
    echo "6. Generate Report"
    echo "7. Backup"
    echo "0. Exit"
    echo

    read -r -p "Choose: " c

    case "$c" in

        1)
            system_info
            ;;

        2)
            users_info
            ;;

        3)
            file_manager
            ;;

        4)
            permissions
            ;;

        5)
            text_tools
            ;;

        6)
            report
            ;;

        7)
            backup
            ;;

        0)
            echo "Goodbye"
            exit
            ;;

        *)
            echo "Invalid option"
            pause
            ;;

    esac

done