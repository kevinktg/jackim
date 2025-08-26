#!/bin/bash

# =============================================================================
# New Research Project Setup Script
# =============================================================================
# 
# SPECIFICATION:
# - Initialize a new research project from the template
# - Extract and organize ZIP files automatically
# - Set up directory structure and templates
# - Configure for GitHub Pages deployment
#
# PSEUDOCODE:
# 1. Validate project name and location
# 2. Create project directory
# 3. Copy template files
# 4. Extract ZIP files if present
# 5. Run organization script
# 6. Initialize git repository
# 7. Configure GitHub Pages
# =============================================================================

set -euo pipefail

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Configuration
SCRIPT_NAME="setup-new-project.sh"
VERSION="1.0.0"

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
}

log_header() {
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Validate project name
validate_project_name() {
    local name="$1"
    
    # Check if name is provided
    if [[ -z "$name" ]]; then
        log_error "Project name is required"
        return 1
    fi
    
    # Check for valid characters (alphanumeric, hyphens, underscores)
    if [[ ! "$name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        log_error "Project name can only contain letters, numbers, hyphens, and underscores"
        return 1
    fi
    
    # Check if directory already exists
    if [[ -d "$name" ]]; then
        log_error "Project directory '$name' already exists"
        return 1
    fi
    
    return 0
}

# Create project structure
create_project() {
    local project_name="$1"
    local parent_dir="$2"
    
    log_header "🚀 Creating New Research Project: $project_name"
    
    # Create project directory
    local project_path="$parent_dir/$project_name"
    mkdir -p "$project_path"
    cd "$project_path"
    
    log_success "Created project directory: $project_path"
    
    # Copy template files
    log_info "Copying template files..."
    
    # Essential template files
    local template_files=(
        "organize-files-enhanced.sh"
        "enhanced-index.html"
        "email-template.html"
        "README.md"
        ".cursorrules"
    )
    
    for file in "${template_files[@]}"; do
        if [[ -f "../$file" ]]; then
            cp "../$file" .
            log_success "Copied $file"
        else
            log_warning "Template file not found: $file"
        fi
    done
    
    # Make scripts executable
    chmod +x organize-files-enhanced.sh 2>/dev/null || true
    
    # Create initial directory structure
    mkdir -p {audio,reports,documents,research,assets,backups}
    log_success "Created directory structure"
    
    # Create project-specific README
    create_project_readme "$project_name"
    
    # Initialize git repository
    if command -v git &> /dev/null; then
        git init
        git add .
        git commit -m "Initial commit: Research project setup" 2>/dev/null || true
        log_success "Initialized git repository"
    else
        log_warning "Git not found. Repository not initialized."
    fi
    
    log_success "Project setup complete!"
}

# Create project-specific README
create_project_readme() {
    local project_name="$1"
    
    cat > README.md << EOF
# $project_name - Research Repository

This repository contains organized research materials, documents, and media files for the **$project_name** project.

## 🚀 Quick Start

1. **Add your research files** to the root directory
2. **Run the organization script**: \`./organize-files-enhanced.sh\`
3. **Review organized files** in the generated directories
4. **Deploy to GitHub Pages** for web access

## 📁 File Organization

The enhanced script automatically organizes files into:

- **\`audio/\`** - Audio files renamed with \`audio_\` prefix
- **\`reports/\`** - HTML files:
  - \`email_*.html\` - Smaller files (<10KB) for email sharing
  - \`website_*.html\` - Larger files for web display
- **\`documents/\`** - PDF, DOC, TXT, MD files
- **\`research/\`** - Images, data files, research assets
- **\`assets/\`** - Additional project assets

## 🛠️ Usage

### Adding New Content
\`\`\`bash
# 1. Copy files to repository root
cp ~/my-audio.mp3 .
cp ~/my-report.html .
cp ~/research-data.pdf .

# 2. Run enhanced organization script
./organize-files-enhanced.sh

# 3. Commit and push
git add .
git commit -m "Add new research materials"
git push origin main
\`\`\`

### Supported File Types

- **Audio**: \`.mp3\`, \`.wav\`, \`.m4a\`, \`.aac\`, \`.flac\`, \`.ogg\`, \`.wma\`
- **HTML Reports**: \`.html\` (auto-categorized by size)
- **Documents**: \`.pdf\`, \`.docx\`, \`.doc\`, \`.txt\`, \`.md\`, \`.rtf\`, \`.odt\`, \`.pages\`
- **Research**: \`.png\`, \`.jpg\`, \`.jpeg\`, \`.gif\`, \`.svg\`, \`.csv\`, \`.json\`, \`.xml\`, \`.xlsx\`, \`.xls\`, \`.zip\`, \`.rar\`, \`.7z\`

## 📄 Template Features

- **Enhanced Interactive Interface** with dark mode UI
- **Automatic File Categorization** with semantic naming
- **Cross-Platform Compatibility** (Linux, macOS, Windows/WSL)
- **GitHub Pages Ready** for web deployment
- **Email Templates** for easy sharing
- **Error Handling** and detailed reporting

## 🌐 GitHub Pages Setup

1. Go to repository Settings → Pages
2. Select source: Deploy from branch \`main\`
3. Your site will be available at: \`https://username.github.io/$project_name\`

## 🔧 Advanced Features

- **Enhanced Error Handling**: Comprehensive validation and error recovery
- **Cross-Platform Support**: Works on Linux, macOS, and Windows/WSL
- **Progress Tracking**: Real-time statistics and progress indicators
- **Backup System**: Automatic backup of existing files
- **Template Generation**: Automatic email and web template creation

---

*Generated by Research Template System v$VERSION*
EOF
}

# Extract ZIP files if present
extract_zip_files() {
    local project_path="$1"
    
    log_header "📦 Processing ZIP Files"
    
    cd "$project_path"
    
    # Look for ZIP files in the project directory
    local zip_count=0
    for zip_file in *.zip; do
        if [[ -f "$zip_file" ]]; then
            log_info "Found ZIP file: $zip_file"
            
            # Create extraction directory
            local extract_dir="${zip_file%.zip}_extracted"
            mkdir -p "$extract_dir"
            
            # Extract ZIP file
            if unzip -q "$zip_file" -d "$extract_dir"; then
                log_success "Extracted $zip_file to $extract_dir/"
                
                # Move extracted files to root
                find "$extract_dir" -type f -exec mv {} . \; 2>/dev/null || true
                
                # Clean up empty directories
                find "$extract_dir" -type d -empty -delete 2>/dev/null || true
                
                # Remove extraction directory if empty
                rmdir "$extract_dir" 2>/dev/null || true
                
                ((zip_count++))
            else
                log_error "Failed to extract $zip_file"
            fi
        fi
    done
    
    if [[ $zip_count -eq 0 ]]; then
        log_info "No ZIP files found"
    else
        log_success "Processed $zip_count ZIP files"
    fi
}

# Main execution
main() {
    log_header "🔧 Research Project Setup Script v$VERSION"
    
    # Check if project name is provided
    if [[ $# -eq 0 ]]; then
        echo -e "${CYAN}Usage: $0 <project-name> [parent-directory]${NC}"
        echo -e "${CYAN}Example: $0 my-research-project ~/projects${NC}"
        exit 1
    fi
    
    local project_name="$1"
    local parent_dir="${2:-.}"
    
    # Validate inputs
    if ! validate_project_name "$project_name"; then
        exit 1
    fi
    
    if [[ ! -d "$parent_dir" ]]; then
        log_error "Parent directory does not exist: $parent_dir"
        exit 1
    fi
    
    # Create project
    create_project "$project_name" "$parent_dir"
    
    # Extract ZIP files if present
    extract_zip_files "$parent_dir/$project_name"
    
    # Run organization script if files were extracted
    if [[ -f "$parent_dir/$project_name/organize-files-enhanced.sh" ]]; then
        log_header "📁 Organizing Extracted Files"
        cd "$parent_dir/$project_name"
        
        if ./organize-files-enhanced.sh; then
            log_success "File organization completed successfully!"
        else
            log_warning "File organization completed with some issues. Please review the output."
        fi
    fi
    
    log_header "✅ Project Setup Complete!"
    echo -e "${CYAN}🎯 Next Steps:${NC}"
    echo -e "  1. Navigate to project: cd $parent_dir/$project_name"
    echo -e "  2. Review organized files in each directory"
    echo -e "  3. Customize templates if needed"
    echo -e "  4. Push to GitHub: git remote add origin <your-repo-url>"
    echo -e "  5. Deploy to GitHub Pages for web access"
    echo ""
    echo -e "${GREEN}🚀 Your research project is ready!${NC}"
}

# Handle script interruption
trap 'log_error "Script interrupted by user"; exit 1' INT TERM

# Run main function
main "$@"
