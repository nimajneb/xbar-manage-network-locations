#!/usr/bin/env bash

# <xbar.title>Network location manager</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Benjamin Wilfing <hallo@nimajneb.dev></xbar.author>
# <xbar.author.github>nimajneb</xbar.author.github>
# <xbar.desc>Manage and network locations and switch them quickly</xbar.desc>
# <xbar.dependencies>bash,osascript</xbar.dependencies>

# <xbar.var>string(VAR_SYMBOL="ᯤ"): Symbol/Character used as a prefix in the menu bar</xbar.var>

IFS=$'\n'

current_location=$(networksetup -getcurrentlocation)
all_locations=$(networksetup -listlocations)

list_locations() {
    for location in $all_locations
    do
        entry_prefix=" "
        if [ "${location}" == "${current_location}" ]
        then
            entry_prefix="✔"
        fi
        echo "${entry_prefix} ${location} | shell=networksetup | param1=-switchtolocation | param2=\"${location}\""
        echo "-- Remove ${location} | shell=networksetup | param1=-deletelocation | param2=\"${location}\""
    done
}

add_location() {
    read -r -d '' prompt <<'EOF'
    set locationName to text returned of (display dialog "Enter the name of the new location" default answer "")
    return locationName
EOF
    location_name=$(osascript -e ${prompt})
    if [ "${location_name}" != "" ]
    then
        networksetup -createlocation "${location_name}" populate
    fi
}

if [ "${1}" == "add-location" ]; then
    add_location
else
    echo "${VAR_SYMBOL} ${current_location}"
    echo "---"
    echo "Switch location"
    echo "---"
    list_locations
    echo "---"
    echo "Add new location | bash=$0 param1=add-location"
fi
