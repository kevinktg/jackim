# 📚 Research Template System - Usage Guide

## 🎯 Overview

This template system provides a comprehensive solution for organizing research materials, documents, and media files. It follows the **SPARC methodology** (Specification, Pseudocode, Architecture, Refinement, Completion) for systematic development and includes automated file organization with a beautiful dark mode web interface.

## 🚀 Quick Start

### Option 1: Create New Project from Template
```bash
# Create a new research project
./setup-new-project.sh my-research-project

# Or specify a custom location
./setup-new-project.sh my-research-project ~/projects
```

### Option 2: Use Existing Template
```bash
# Add your files to the root directory
cp ~/my-research-files.zip .
cp ~/audio-recording.mp3 .
cp ~/research-report.html .

# Run the enhanced organization script
./organize-files-enhanced.sh
```

## 📁 File Organization System

### Automatic Categorization

The system automatically organizes files into semantic directories:

| Directory | File Types | Naming Convention |
|-----------|------------|-------------------|
| `audio/` | `.mp3`, `.wav`, `.m4a`, `.aac`, `.flac`, `.ogg`, `.wma` | `audio_filename.ext` |
| `reports/` | `.html` (categorized by size) | `email_filename.html` (small) / `website_filename.html` (large) |
| `documents/` | `.pdf`, `.docx`, `.doc`, `.txt`, `.md`, `.rtf`, `.odt`, `.pages` | Original filename |
| `research/` | `.png`, `.jpg`, `.jpeg`, `.gif`, `.svg`, `.csv`, `.json`, `.xml`, `.xlsx`, `.xls`, `.zip`, `.rar`, `.7z` | Original filename |
| `assets/` | Additional project assets | Original filename |

### File Size Logic
- **HTML files < 10KB**: Categorized as email-friendly versions
- **HTML files ≥ 10KB**: Categorized as website versions

## 🛠️ Scripts Overview

### 1. `setup-new-project.sh`
**Purpose**: Initialize new research projects from template

**Features**:
- Creates project directory with proper structure
- Copies all template files
- Extracts ZIP files automatically
- Initializes git repository
- Runs organization script on extracted files

**Usage**:
```bash
./setup-new-project.sh <project-name> [parent-directory]
```

### 2. `organize-files-enhanced.sh`
**Purpose**: Organize files with enhanced error handling and reporting

**Features**:
- Cross-platform compatibility (Linux, macOS, Windows/WSL)
- Comprehensive error handling and validation
- Progress tracking and statistics
- Automatic backup system
- Color-coded output for better UX

**Usage**:
```bash
./organize-files-enhanced.sh
```

### 3. `organize-files.sh` (Legacy)
**Purpose**: Original organization script (maintained for compatibility)

## 🎨 Web Interface Features

### Dark Mode UI
- **Glass morphism** design with backdrop filters
- **Purple/blue gradient** theme (`#667eea` to `#764ba2`)
- **Responsive design** for all devices
- **Interactive elements** with smooth animations

### Key Components
- **File Browser**: Navigate organized files
- **Audio Player**: Built-in audio visualization
- **Search Functionality**: Find files quickly
- **Statistics Dashboard**: View file organization metrics
- **Email Templates**: Ready-to-use sharing templates

## 📋 Workflow Examples

### Example 1: New Research Project
```bash
# 1. Create new project
./setup-new-project.sh migration-research

# 2. Add ZIP file with research data
cp migration-aus.zip migration-research/

# 3. Navigate to project
cd migration-research

# 4. Run organization (automatically done by setup script)
./organize-files-enhanced.sh

# 5. Review organized files
ls -la audio/ reports/ documents/ research/

# 6. Deploy to GitHub Pages
git remote add origin https://github.com/username/migration-research.git
git push -u origin main
```

### Example 2: Adding New Files
```bash
# 1. Add new research files
cp ~/new-audio.mp3 .
cp ~/research-paper.pdf .
cp ~/data-analysis.csv .

# 2. Organize files
./organize-files-enhanced.sh

# 3. Commit changes
git add .
git commit -m "Add new research materials"
git push
```

### Example 3: Batch Processing
```bash
# 1. Extract multiple ZIP files
for zip in *.zip; do
    unzip "$zip"
done

# 2. Organize all extracted files
./organize-files-enhanced.sh

# 3. Review organization report
cat organization-report.txt
```

## 🔧 Advanced Configuration

### Custom File Types
Edit `organize-files-enhanced.sh` to add new file extensions:

```bash
# Add new audio format
local audio_extensions=("mp3" "wav" "m4a" "aac" "flac" "ogg" "wma" "opus")

# Add new document format
local doc_extensions=("pdf" "docx" "doc" "txt" "md" "rtf" "odt" "pages" "epub")
```

### Custom Directory Structure
Modify the directory creation in the script:

```bash
local directories=("audio" "reports" "documents" "research" "assets" "backups" "custom-folder")
```

### Template Customization
- **Web Interface**: Edit `enhanced-index.html`
- **Email Templates**: Edit `email-template.html`
- **Styling**: Modify CSS in the HTML files

## 🌐 GitHub Pages Deployment

### Automatic Deployment
1. Push to GitHub repository
2. Go to Settings → Pages
3. Select source: Deploy from branch `main`
4. Site will be available at `https://username.github.io/repository-name`

### Custom Domain
1. Add custom domain in repository Settings → Pages
2. Configure DNS records
3. Enable HTTPS enforcement

## 🔍 Troubleshooting

### Common Issues

**Script Permission Denied**
```bash
chmod +x organize-files-enhanced.sh
chmod +x setup-new-project.sh
```

**ZIP Extraction Failed**
```bash
# Install unzip if not available
sudo apt-get install unzip  # Ubuntu/Debian
brew install unzip          # macOS
```

**Git Not Found**
```bash
# Install git
sudo apt-get install git    # Ubuntu/Debian
brew install git            # macOS
```

**Cross-Platform Issues**
- Script automatically detects OS and uses appropriate commands
- File size detection works on Linux, macOS, and Windows/WSL
- All paths use forward slashes for compatibility

### Error Recovery
- **Backup System**: Original files are backed up before moving
- **Error Logging**: All errors are logged with details
- **Graceful Degradation**: Script continues even if some files fail

## 📊 Performance Optimization

### Large File Sets
- Script processes files in batches
- Progress indicators for long operations
- Memory-efficient file handling

### Network Deployment
- Optimized for GitHub Pages
- Minified assets for faster loading
- CDN integration for external resources

## 🎯 Best Practices

### File Naming
- Use descriptive filenames
- Avoid special characters
- Include dates in filenames when relevant

### Organization
- Run organization script regularly
- Review categorization results
- Keep backup copies of important files

### Version Control
- Commit after each organization run
- Use descriptive commit messages
- Tag important versions

### Documentation
- Update README for project-specific information
- Document any customizations
- Include usage examples

## 🔮 Future Enhancements

### Planned Features
- **AI-powered categorization** using file content analysis
- **Advanced search** with full-text indexing
- **Collaborative features** for team research
- **Integration** with research management systems
- **Mobile app** for on-the-go access

### Extension Points
- **Plugin system** for custom file processors
- **API endpoints** for programmatic access
- **Webhook support** for automated workflows
- **Multi-language support** for international research

---

*This guide follows SPARC methodology and emphasizes systematic, user-friendly documentation for optimal research organization.*
