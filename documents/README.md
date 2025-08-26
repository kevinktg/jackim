# 📚 Research & Document Repository Template

This repository serves as a comprehensive template for organizing research materials, documents, and media files. It follows the **SPARC methodology** (Specification, Pseudocode, Architecture, Refinement, Completion) for systematic development and includes automated file organization with a beautiful dark mode web interface.

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

## 📁 File Organization

The enhanced script automatically organizes files into:

- **`audio/`** - Audio files renamed with `audio_` prefix
- **`reports/`** - HTML files:
  - `email_*.html` - Smaller files (<10KB) for email sharing
  - `website_*.html` - Larger files for web display
- **`documents/`** - PDF, DOC, TXT, MD, RTF, ODT, Pages files
- **`research/`** - Images, data files, research assets
- **`assets/`** - Additional project assets
- **`backups/`** - Automatic backups of existing files

## 🛠️ Usage

### Adding New Content
```bash
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
```

### Supported File Types

- **Audio**: `.mp3`, `.wav`, `.m4a`, `.aac`, `.flac`, `.ogg`, `.wma`
- **HTML Reports**: `.html` (auto-categorized by size)
- **Documents**: `.pdf`, `.docx`, `.doc`, `.txt`, `.md`, `.rtf`, `.odt`, `.pages`
- **Research**: `.png`, `.jpg`, `.jpeg`, `.gif`, `.svg`, `.csv`, `.json`, `.xml`, `.xlsx`, `.xls`, `.zip`, `.rar`, `.7z`

## 📄 Template Features

- **Enhanced Interactive Interface** with dark mode UI and glass morphism design
- **Automatic File Categorization** with semantic naming and cross-platform support
- **GitHub Pages Ready** for instant web deployment
- **Email Templates** for easy sharing and collaboration
- **Error Handling** and comprehensive reporting with progress tracking
- **Backup System** for safe file operations
- **Cross-Platform Compatibility** (Linux, macOS, Windows/WSL)

## 🌐 GitHub Pages Setup

1. Go to repository Settings → Pages
2. Select source: Deploy from branch `main`
3. Your site will be available at: `https://username.github.io/repository-name`

## 📚 Documentation

- **[Usage Guide](USAGE-GUIDE.md)** - Comprehensive guide with examples and troubleshooting
- **[Cursor Rules](.cursorrules)** - Development guidelines and project structure
- **Enhanced Scripts** - `organize-files-enhanced.sh` and `setup-new-project.sh`

## 🔧 Advanced Features

- **SPARC Methodology** - Systematic development approach
- **Chain of Thought** - Logical reasoning and planning
- **Dark Mode UI** - Modern, accessible interface design
- **Error Recovery** - Robust error handling and backup systems