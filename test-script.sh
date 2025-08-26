#!/bin/bash

# Test script to check the problematic line
set -euo pipefail

process_audio_files() {
    local audio_extensions=("mp3" "wav" "m4a" "aac" "flac" "ogg" "wma")
    
    for ext in "${audio_extensions[@]}"; do
        for file in *."$ext" 2>/dev/null; do
            echo "Found file: $file"
        done
    done
}

process_audio_files