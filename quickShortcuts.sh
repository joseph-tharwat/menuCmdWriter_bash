#!/bin/bash

cmdTextFile=~/projects/Bash_projects/cmdMenu/shortcutCmd.txt

cmds=$(cat "${cmdTextFile}")


selectedValue=$(echo "${cmds}" | rofi -dmenu -p "select/add/remove cmd: ")

#add new cmd
if [[ "${selectedValue}" = "add" ]]; then
    echo "${selectedValue}"
    newCmd=$(rofi -dmenu -p "Enter the new cmd: ")
    if [[ -n "${newCmd}" ]]; then
        echo "${newCmd}" >> "${cmdTextFile}"
    fi  

#remove a cmd
elif [[ "${selectedValue}" = "remove" ]]; then
    #echo "${selectedValue}"
    #open vs code to edite
    code "${cmdTextFile}"

#execute a cmd
elif [[ -n ${selectedValue} ]]; then
    #echo "${selectedValue}"
    xdotool type -delay 1 "${selectedValue}"
fi

