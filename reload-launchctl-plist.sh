#!/bin/bash
# This script is for testing and development of launchctl scripts
# Main configuration of LaunchAgents is in $HOME/Library/LaunchAgents

if [ -z "$1" ]; then
    echo "No argument supplied"
    echo "Usage: ~/reload-launchctl-plist.sh io.git.version"
    echo "exit..."
    exit 1
fi

name=$1
echo "🚀 Processing: $name"

echo "🧹 bootout $name"
launchctl bootout gui/`id -u`/$name
echo "🏁 bootstrap $name.plist"
launchctl bootstrap gui/`id -u` ~/Library/LaunchAgents/$name.plist
echo "🎬 kickstart $name"
launchctl kickstart -k gui/`id -u`/$name
echo "ℹ️  process id for $name"
launchctl kickstart -p gui/`id -u`/$name
echo "🖨️  process info"
launchctl print gui/`id -u` | grep $name
