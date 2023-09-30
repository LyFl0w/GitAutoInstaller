#!/bin/bash

# Checks if Git is already installed
if ! command -v git &> /dev/null
then
    # Install Git using your system's package manager (apt, yum, pacman, etc.).
    if command -v apt &> /dev/null; then
        sudo apt install git -y
    elif command -v yum &> /dev/null; then
        sudo yum install git -y
    elif command -v pacman &> /dev/null; then
        sudo pacman -S git --noconfirm
    else
        echo "Your package manager is not supported. Please install Git manually.."
        exit 1
    fi

    # Checks again if installation was successful
    if ! command -v git &> /dev/null
    then
        echo "Git installation failed.Please install it manually."
        exit 1
    else
        echo "Git has been successfully installed."
    fi
fi
