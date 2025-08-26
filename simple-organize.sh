#!/bin/bash

# =============================================================================
# Enhanced File Organization Script for Research & Document Repository
# =============================================================================

set -euo pipefail

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

# Cross-platform file size detection
get_file_size() {
    local file="$1"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        stat -f%z "$file" 2>/dev/null || echo "0"
    else
        stat -c%s "$file" 2>/dev/null || echo "0"
    fi
}

# Safe file move with backup
safe_move() {
    local src="$1"
    local dest="$2"
    
    if [[ ! -f "$src" ]]; then
        log_warning "Source file not found: $src"
        return 1
    fi
    
    local dest_dir=$(dirname "$dest")
    mkdir -p "$dest_dir"
    
    if [[ -f "$dest" ]]; then
        local backup="${dest}.backup.$(date +%s)"
        log_warning "Destination exists, creating backup: $backup"
        mv "$dest" "$backup"
    fi
    
    if mv "$src" "$dest" 2>/dev/null; then
        log_success "Moved $src → $dest"
        ((PROCESSED_FILES++))
        return 0
    else
        log_error "Failed to move $src → $dest"
        return 1
    fi
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
        # Use a safer approach to find files
        local files=()
        while IFS= read -r -d '' file; do
            files+=("$file")
        done < <(find . -maxdepth 1 -name "*.$ext" -type f -print0 2>/dev/null)
        
        for file in "${files[@]}"; do
            # Remove the ./ prefix from the filename
            file=${file#./}
            ((TOTAL_FILES++))
            
            local basename="${file%.*}"
            local extension="${file##*.}"
            
            local new_name="audio_${basename}.${extension}"
            local dest="audio/$new_name"
            
            if safe_move "$file" "$dest"; then
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

process_html_files() {
    log_header "📄 Processing HTML Files"
    
    local processed=0
    local email_count=0
    local website_count=0
    
    # Process HTML files with a safer approach
    local files=()
    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(find . -maxdepth 1 -name "*.html" -type f ! -name "index.html" ! -name "enhanced-index.html" -print0 2>/dev/null)
    
    for file in "${files[@]}"; do
        # Remove the ./ prefix from the filename
        file=${file#./}
        ((TOTAL_FILES++))
        
        local size=$(get_file_size "$file")
        
        if [[ $size -lt 10240 ]]; then
            local dest="reports/email_${file}"
            if safe_move "$file" "$dest"; then
                ((email_count++))
                ((processed++))
            fi
        else
            local dest="reports/website_${file}"
            if safe_move "$file" "$dest"; then
                ((website_count++))
                ((processed++))
            fi
        fi
    done
    
    if [[ $processed -eq 0 ]]; then
        log_info "No HTML files found"
    else
        log_success "Processed $processed HTML files ($email_count email, $website_count website)"
    fi
}

process_document_files() {
    log_header "📋 Processing Document Files"
    
    local doc_extensions=("pdf" "docx" "doc" "txt" "md" "rtf" "odt" "pages")
    local processed=0
    
    for ext in "${doc_extensions[@]}"; do
        local files=()
        while IFS= read -r -d '' file; do
            files+=("$file")
        done < <(find . -maxdepth 1 -name "*.$ext" -type f -print0 2>/dev/null)
        
        for file in "${files[@]}"; do
            # Remove the ./ prefix from the filename
            file=${file#./}
            ((TOTAL_FILES++))
            
            local dest="documents/$file"
            if safe_move "$file" "$dest"; then
                ((processed++))
            fi
        done
    done
    
    if [[ $processed -eq 0 ]]; then
        log_info "No document files found"
    else
        log_success "Processed $processed document files"
    fi
}

process_research_files() {
    log_header "🔬 Processing Research Assets"
    
    local research_extensions=("png" "jpg" "jpeg" "gif" "svg" "csv" "json" "xml" "xlsx" "xls" "zip" "rar" "7z")
    local processed=0
    
    for ext in "${research_extensions[@]}"; do
        local files=()
        while IFS= read -r -d '' file; do
            files+=("$file")
        done < <(find . -maxdepth 1 -name "*.$ext" -type f -print0 2>/dev/null)
        
        for file in "${files[@]}"; do
            # Remove the ./ prefix from the filename
            file=${file#./}
            ((TOTAL_FILES++))
            
            local dest="research/$file"
            if safe_move "$file" "$dest"; then
                ((processed++))
            fi
        done
    done
    
    if [[ $processed -eq 0 ]]; then
        log_info "No research files found"
    else
        log_success "Processed $processed research files"
    fi
}

main() {
    log_header "🚀 Enhanced File Organization Script"
    
    create_directory_structure
    process_audio_files
    process_html_files
    process_document_files
    process_research_files
    
    log_header "✅ Organization Complete!"
}

# Only run main if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi