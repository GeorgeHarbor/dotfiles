#!/bin/bash

# Get the ID of the currently focused window
focused_window=$(hyprctl activewindow -j | jq -r '.workspace.id')

# Get the ID of the current workspace
current_workspace=$(hyprctl monitors -j | jq -r '.[0].activeWorkspace.id')

# Check if the focused window is on the current workspace
if [[ "$focused_window" == "null" ]] || [[ "$focused_window" != "$current_workspace" ]]; then
    echo ""  # No window focused or not on the current workspace
else
    # Output the window title or relevant information
    hyprctl activewindow -j | jq -r '.title'
fi
