#!/usr/bin/env bash

# <xbar.title>Network location switcher</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Benjamin Wilfing <hallo@nimajneb.dev></xbar.author>
# <xbar.author.github>nimajneb</xbar.author.github>
# <xbar.desc>Switch your network location quickly</xbar.desc>
# <xbar.dependencies>bash</xbar.dependencies>

current_location=$(networksetup -getcurrentlocation)
all_locations=$(networksetup -listlocations)

echo "ᯤ ${current_location}"
echo "---"
echo "Switch location"
echo "---"
IFS=$'\n'
for location in $all_locations
do
    entry_prefix=" "
    if [ "${location}" == "${current_location}" ]
    then
        entry_prefix="✔"
    fi
    echo "${entry_prefix} ${location} | shell=networksetup | param1=-switchtolocation | param2=\"${location}\""
done
