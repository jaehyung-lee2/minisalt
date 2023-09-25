#!/bin/bash

# Read server groups from the JSON file
serverGroups=($(python -c 'import json; data = json.load(open("servers.json")); print("\n".join(data.keys()))'))

# Display server groups for selection
echo "[SERVER GROUPS]:"
for i in "${!serverGroups[@]}"; do
    echo "$((i+1))) ${serverGroups[$i]}"
done

# Get selection from user
read -p "Select server by number: " selection

if [[ $selection -lt 1 || $selection -gt ${#serverGroups[@]} ]]; then
    echo "Invalid choice!"
    exit 1
fi

selectedGroup="${serverGroups[$((selection-1))]}"

# Get command from user
read -p "Enter command: " userInput

function cmd {
	printf "========== [$1] ========\n"
	ssh "irteam@$1" "$userInput"
	printf "\n\n"
}

# Fetch servers from JSON for the selected group
servers=($(python -c "import json; data = json.load(open('servers.json')); print('\n'.join(data['$selectedGroup']))"))

for server in "${servers[@]}"; do
    cmd "$server"
done