#!/bin/bash

# =============================================================================
# Enhanced File Organization Script for Research & Document Repository
# =============================================================================

# Remove the strict mode for now to see what's causing the error
# set -euo pipefail

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Statistics tracking
TOTAL_FILES=0
PROCESSED_FILES=0
ERRORS=0

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
    ((ERRORS++))
}

log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_header() {
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

create_directory_structure() {
    log_header "📁 Creating Directory Structure"
    
    local directories=("audio" "reports" "documents" "research" "assets" "backups")
    
    for dir in "${directories[@]}"; do
        if mkdir -p "$dir" 2>/dev/null; then
            log_success "Created directory: $dir/"
        else
            log_warning "Directory already exists or cannot create: $dir/"
        fi
    done
}

process_audio_files() {
    log_header "🎵 Processing Audio Files"
    
    local audio_extensions=("mp3" "wav" "m4a" "aac" "flac" "ogg" "wma")
    local processed=0
    
    for ext in "${audio_extensions[@]}"; do
        # Simple approach for now
        for file in *."$ext"; do
            if [[ -f "$file" ]] && [[ "$file" != "*.$ext" ]]; then
                log_info "Found audio file: $file"
                ((processed++))
            fi
        done
    done
    
    if [[ $processed -eq 0 ]]; then
        log_info "No audio files found"
    else
        log_success "Processed $processed audio files"
    fi
}

main() {
    log_header "🚀 Enhanced File Organization Script"
    
    create_directory_structure
    process_audio_files
    
    log_header "✅ Organization Complete!"
}

# Only run main if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi