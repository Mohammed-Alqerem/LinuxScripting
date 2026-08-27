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

                                                            