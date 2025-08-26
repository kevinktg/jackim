#!/bin/bash

# =============================================================================
# Enhanced File Organization Script for Research & Document Repository
# =============================================================================
# 
# SPECIFICATION:
# - Automatically organize research files into categorized directories
# - Rename files with semantic prefixes for easy identification
# - Generate web interface and email templates
# - Cross-platform compatibility (Linux, macOS, Windows/WSL)
#
# PSEUDOCODE:
# 1. Validate environment and dependencies
# 2. Create directory structure
# 3. Process audio files (rename with audio_ prefix)
# 4. Process HTML files (categorize by size)
# 5. Process documents (PDF, DOC, TXT, MD)
# 6. Process research assets (images, data files)
# 7. Generate templates and summaries
# 8. Provide user feedback and statistics
#
# ARCHITECTURE:
# - Modular functions for each file type
# - Error handling and logging
# - Cross-platform file size detection
# - Progress indicators and user feedback
#
# REFINEMENT:
# - Added validation and error recovery
# - Enhanced user interface with colors
# - Improved file categorization logic
# - Better documentation and usage examples
#
# COMPLETION:
# - Full implementation with all features
# - Comprehensive error handling
# - User-friendly output and statistics
# =============================================================================

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_NAME="organize-files-enhanced.sh"
VERSION="2.0.0"
AUTHOR="Research Template System"

# Statistics tracking
TOTAL_FILES=0
PROCESSED_FILES=0
ERRORS=0

# =============================================================================
# UTILITY FUNCTIONS
# =============================================================================

log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

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

log_header() {
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Cross-platform file size detection
get_file_size() {
    local file="$1"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        stat -f%z "$file" 2>/dev/null || echo "0"
    else
        # Linux and Windows/WSL
        stat -c%s "$file" 2>/dev/null || echo "0"
    fi
}

# Validate file exists and is readable
validate_file() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        log_warning "File not found: $file"
        return 1
    fi
    if [[ ! -r "$file" ]]; then
        log_error "File not readable: $file"
        return 1
    fi
    return 0
}

# Safe file move with backup
safe_move() {
    local src="$1"
    local dest="$2"
    
    if [[ ! -f "$src" ]]; then
        log_warning "Source file not found: $src"
        return 1
    fi
    
    # Create destination directory if it doesn't exist
    local dest_dir=$(dirname "$dest")
    mkdir -p "$dest_dir"
    
    # Check if destination already exists
    if [[ -f "$dest" ]]; then
        local backup="${dest}.backup.$(date +%s)"
        log_warning "Destination exists, creating backup: $backup"
        mv "$dest" "$backup"
    fi
    
    # Move file
    if mv "$src" "$dest" 2>/dev/null; then
        log_success "Moved $src → $dest"
        ((PROCESSED_FILES++))
        return 0
    else
        log_error "Failed to move $src → $dest"
        return 1
    fi
}

# =============================================================================
# VALIDATION AND SETUP
# =============================================================================

validate_environment() {
    log_header "🔧 Environment Validation"
    
    # Check if we're in the right directory
    if [[ ! -f "organize-files.sh" ]] && [[ ! -f "enhanced-index.html" ]]; then
        log_error "Not in a valid template directory. Please run from the repository root."
        exit 1
    fi
    
    # Check for required tools
    local required_tools=("bash" "mkdir" "mv" "stat" "date")
    for tool in "${required_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            log_error "Required tool not found: $tool"
            exit 1
        fi
    done
    
    log_success "Environment validation passed"
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

# =============================================================================
# FILE PROCESSING FUNCTIONS
# =============================================================================

process_audio_files() {
    log_header "🎵 Processing Audio Files"
    
    local audio_extensions=("mp3" "wav" "m4a" "aac" "flac" "ogg" "wma")
    local processed=0
    
    for ext in "${audio_extensions[@]}"; do
        for file in *."$ext" 2>/dev/null; do
            if [[ -f "$file" ]]; then
                ((TOTAL_FILES++))
                
                # Get base name and extension
                local basename="${file%.*}"
                local extension="${file##*.}"
                
                # Create semantic name
                local new_name="audio_${basename}.${extension}"
                local dest="audio/$new_name"
                
                if safe_move "$file" "$dest"; then
                    ((processed++))
                fi
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
    
    for file in *.html; do
        if [[ -f "$file" ]] && [[ "$file" != "index.html" ]] && [[ "$file" != "enhanced-index.html" ]]; then
            ((TOTAL_FILES++))
            
            # Get file size
            local size=$(get_file_size "$file")
            local size_kb=$((size / 1024))
            
            if [[ $size -lt 10240 ]]; then
                # Less than 10KB = email version
                local dest="reports/email_${file}"
                if safe_move "$file" "$dest"; then
                    ((email_count++))
                    ((processed++))
                fi
            else
                # Larger file = website version
                local dest="reports/website_${file}"
                if safe_move "$file" "$dest"; then
                    ((website_count++))
                    ((processed++))
                fi
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
        for file in *."$ext" 2>/dev/null; do
            if [[ -f "$file" ]]; then
                ((TOTAL_FILES++))
                
                local dest="documents/$file"
                if safe_move "$file" "$dest"; then
                    ((processed++))
                fi
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
        for file in *."$ext" 2>/dev/null; do
            if [[ -f "$file" ]]; then
                ((TOTAL_FILES++))
                
                local dest="research/$file"
                if safe_move "$file" "$dest"; then
                    ((processed++))
                fi
            fi
        done
    done
    
    if [[ $processed -eq 0 ]]; then
        log_info "No research files found"
    else
        log_success "Processed $processed research files"
    fi
}

# =============================================================================
# TEMPLATE GENERATION
# =============================================================================

generate_templates() {
    log_header "🌐 Generating Templates"
    
    # Use enhanced template as main index if it exists
    if [[ -f "enhanced-index.html" ]]; then
        if cp "enhanced-index.html" "index.html" 2>/dev/null; then
            log_success "Updated to enhanced interactive template"
        else
            log_warning "Could not update index.html"
        fi
    fi
    
    # Generate email templates for HTML reports
    if [[ -f "email-template.html" ]]; then
        local email_count=0
        for file in reports/email_*.html reports/website_*.html; do
            if [[ -f "$file" ]]; then
                local basename_file=$(basename "$file" .html)
                local email_template="reports/email_${basename_file}_summary.html"
                
                # Create email template with GitHub link
                if sed "s|#github-link.*href=\"#\"|href=\"https://$(git config --get remote.origin.url 2>/dev/null | sed 's/.*github.com[:/]\([^/]*\/[^/]*\).*/\1/' | sed 's/\.git$//')\"|g" email-template.html > "$email_template" 2>/dev/null; then
                    log_success "Created email summary for $file"
                    ((email_count++))
                fi
            fi
        done
        
        if [[ $email_count -gt 0 ]]; then
            log_success "Generated $email_count email templates"
        fi
    fi
}

# =============================================================================
# STATISTICS AND REPORTING
# =============================================================================

generate_report() {
    log_header "📊 Organization Report"
    
    echo -e "${CYAN}📈 File Processing Statistics:${NC}"
    echo -e "  • Total files found: ${TOTAL_FILES}"
    echo -e "  • Successfully processed: ${PROCESSED_FILES}"
    echo -e "  • Errors encountered: ${ERRORS}"
    echo -e "  • Success rate: $(( (PROCESSED_FILES * 100) / TOTAL_FILES ))%"
    
    echo -e "\n${CYAN}📁 Directory Contents:${NC}"
    for dir in audio reports documents research assets; do
        if [[ -d "$dir" ]]; then
            local count=$(find "$dir" -type f 2>/dev/null | wc -l)
            echo -e "  • $dir/: $count files"
        fi
    done
    
    echo -e "\n${CYAN}🎯 Next Steps:${NC}"
    echo -e "  1. Review organized files in each directory"
    echo -e "  2. Customize templates if needed"
    echo -e "  3. Commit changes: git add . && git commit -m 'Organize research files'"
    echo -e "  4. Deploy to GitHub Pages for web access"
    
    if [[ $ERRORS -gt 0 ]]; then
        echo -e "\n${YELLOW}⚠️  Note: $ERRORS errors occurred. Check the output above for details.${NC}"
    fi
}

# =============================================================================
# MAIN EXECUTION
# =============================================================================

main() {
    log_header "🚀 Enhanced File Organization Script v$VERSION"
    echo -e "${CYAN}Author: $AUTHOR${NC}"
    echo -e "${CYAN}Date: $(date)${NC}"
    echo ""
    
    # Reset counters
    TOTAL_FILES=0
    PROCESSED_FILES=0
    ERRORS=0
    
    # Execute workflow
    validate_environment
    create_directory_structure
    process_audio_files
    process_html_files
    process_document_files
    process_research_files
    generate_templates
    generate_report
    
    log_header "✅ Organization Complete!"
    
    if [[ $ERRORS -eq 0 ]]; then
        log_success "All files processed successfully!"
        exit 0
    else
        log_warning "Completed with $ERRORS errors. Please review the output above."
        exit 1
    fi
}

# Handle script interruption
trap 'log_error "Script interrupted by user"; exit 1' INT TERM

# Run main function
main "$@"
