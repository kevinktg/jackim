# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Structure

This is a research and documentation repository containing:

1. **Main Project**: A single-page web application (`index.html`) for Australian migration strategy documentation, built with:
   - Tailwind CSS (CDN)
   - Vanilla JavaScript 
   - GSAP animations
   - Chart.js for data visualization
   - Custom glass morphism design system (`assets/handcrafted-design-system.css`)

2. **Document Repository**: Organized research materials, audio files, reports, and assets following a structured template system with SPARC methodology

## Development Commands

### Web Development
- The main site is a single HTML file with inline styles and JavaScript
- Uses CDN-hosted libraries (Tailwind, GSAP, Chart.js)
- No build process required - direct file editing
- Open `index.html` directly in browser for development

### Node.js Dependencies
```bash
# Install dependencies (AI SDK and Liquid Glass components)
npm install

# Dependencies are minimal and mainly for design system components
```

## Code Architecture

### Web Application (`index.html`)
- Self-contained single-page application with inline CSS and JavaScript
- Glass morphism design with dark mode theme (`#333330` background)
- GSAP-powered scroll animations and transitions
- Chart.js for interactive data visualization
- Responsive design with mobile-first approach
- Uses Syne font for headings, Poppins for body text
- Custom design system in `assets/handcrafted-design-system.css`

### File Organization Structure
- `assets/`: Images, design system CSS, and media assets
- `audio/`: Audio recordings (MP3 files)
- `documents/`: PDF, DOC, and documentation files (README, USAGE-GUIDE)
- `reports/`: HTML reports and statistics files
- `media/`: SVG icons, videos, and graphics
- `archive/`: Archived migration-related materials
- `research/`: Research data and compressed archives

## Development Guidelines

### Following SPARC Methodology
The project follows SPARC workflow:
- **Specification**: Define requirements clearly
- **Pseudocode**: Outline logic before implementation  
- **Architecture**: Identify files and interfaces
- **Refinement**: Make minimal, verifiable changes
- **Completion**: Validate with tests/lint

### Cursor Rules Integration
The repository includes comprehensive Cursor IDE rules:
- **SPARC Methodology** (`.cursor/rules/sparc.mdc`): Specification → Pseudocode → Architecture → Refinement → Completion
- **Code Style** (`.cursorrules`): Focus on HTML, Tailwind CSS, and vanilla JavaScript with modern best practices
- **Development Approach**: Treat user as expert, anticipate needs, write complete functional code without TODOs

### File Organization Template System
- `assets/`: Images, design system CSS, logos, and media assets
- `audio/`: MP3 audio recordings and interviews
- `documents/`: PDF, DOC files, README and USAGE-GUIDE documentation
- `reports/`: HTML reports, statistics files, and email templates
- `media/`: SVG icons, videos, and graphics organized by type
- `archive/`: Historical migration materials and compressed data
- `research/`: Research data, ZIP archives, and analysis materials

## Testing & Validation

### Web Application Testing
- Manual testing in browser required - open `index.html` directly
- Verify responsive design across devices (mobile-first approach)
- Test GSAP scroll animations and glass morphism effects
- Validate Chart.js data visualization (visa points and alignment charts)
- Check audio/video media playback functionality
- Ensure proper CDN library loading (Tailwind, GSAP, Chart.js)

### Content Validation
- Verify all asset links are working (images, audio, video)
- Test external links (NotebookLM AI Research Assistant)
- Validate glass morphism hover effects and liquid animations
- Check font rendering (Syne for headings, Poppins for body)