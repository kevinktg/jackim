#!/bin/bash

# Test script to check the problematic line
set -euo pipefail

process_audio_files() {
    local audio_extensions=("mp3" "wav" "m4a" "aac" "flac" "ogg" "wma")
    
    for ext in "${audio_extensions[@]}"; do
        # Let's try a different approach
        for file in $(ls *."$ext" 2>/dev/null); do
            if [ -f "$file" ]; then
                echo "Found file: $file"
            fi
        done
    done
}

process_audio_files