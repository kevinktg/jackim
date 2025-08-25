# Document & Research Repository Template

This repository serves as a permanent template for organizing documents, research materials, and media files.

## 🚀 Quick Start

1. **Add your files** to the root directory
2. **Run the organization script**: `./organize-files.sh`
3. **Push to GitHub Pages** for web access

## 📁 File Organization

The script automatically organizes files into:

- **`audio/`** - Audio files renamed with `audio_` prefix
- **`reports/`** - HTML files:
  - `email_*.html` - Smaller files (<10KB) for email sharing
  - `website_*.html` - Larger files for web display
- **`documents/`** - PDF, DOC, TXT, MD files
- **`research/`** - Images, data files, research assets

## 🛠️ Usage

### Adding New Content
```bash
# 1. Copy files to repository root
cp ~/my-audio.mp3 .
cp ~/my-report.html .
cp ~/research-data.pdf .

# 2. Run organization script
./organize-files.sh

# 3. Commit and push
git add .
git commit -m "Add new research materials"
git push origin main
```

### Supported File Types

- **Audio**: `.mp3`, `.wav`, `.m4a`, `.aac`, `.flac`
- **HTML Reports**: `.html` (auto-categorized by size)
- **Documents**: `.pdf`, `.docx`, `.doc`, `.txt`, `.md`
- **Research**: `.png`, `.jpg`, `.jpeg`, `.gif`, `.svg`, `.csv`, `.json`, `.xml`

## 📄 Template Features

- Responsive web interface via `index.html`
- Automatic file categorization
- GitHub Pages compatible
- Easy file sharing and access
- Permanent document storage

## 🌐 GitHub Pages Setup

1. Go to repository Settings → Pages
2. Select source: Deploy from branch `main`
3. Your site will be available at: `https://username.github.io/repository-name`