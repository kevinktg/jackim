#!/bin/bash

# Demo Setup Script - Test the enhanced template functionality
echo "🚀 Setting up demo content for enhanced template..."

# Create demo content
echo "📝 Creating demo files..."

# Copy the test site content to demonstrate
cp "test-site/migration-aus/audio.mp3" "demo_audio.mp3"
cp "test-site/migration-aus/e-mail.html" "demo_email.html" 
cp "test-site/migration-aus/index.html" "demo_website.html"
cp "test-site/migration-aus/report.docx" "demo_report.docx"

# Create additional demo content
echo "Creating additional demo files for testing..."

# Demo documents
cat > "demo_research_notes.txt" << 'EOF'
Research Notes - AI Migration Strategy Analysis
==============================================

Key findings from document analysis:
- Strategic approach to visa applications
- AI-powered insights for optimization
- Regional focus for maximum impact

Next steps:
1. Implement chatbot recommendations
2. Analyze audio transcriptions
3. Generate comprehensive report
EOF

# Demo CSV data
cat > "demo_data.csv" << 'EOF'
Category,Count,Priority
Documents,12,High
Reports,4,Medium
Audio Files,3,High
Research Assets,8,Medium
Total Files,27,High
EOF

# Demo JSON research data
cat > "demo_results.json" << 'EOF'
{
  "analysis_results": {
    "document_count": 12,
    "audio_duration_minutes": 45,
    "key_themes": ["migration", "AI strategy", "regional development"],
    "confidence_score": 0.92,
    "recommendations": [
      "Focus on Victorian state nomination",
      "Emphasize AI and technology skills",
      "Highlight regional contribution potential"
    ]
  }
}
EOF

echo "  ✓ Created demo documents"
echo "  ✓ Created demo data files"
echo "  ✓ Created demo research files"

# Run the enhanced organization script
echo ""
echo "🔧 Running enhanced organization script..."
./organize-files.sh

echo ""
echo "✅ Demo setup complete!"
echo ""
echo "🌐 You can now:"
echo "  1. Open index.html to see the enhanced interactive template"
echo "  2. View organized files in respective directories"
echo "  3. Test the audio player with demo audio files"
echo "  4. Try the document chatbot functionality"
echo "  5. Check email templates in the reports/ directory"
echo ""
echo "📁 Demo content created:"
echo "  ├── audio/          - Demo audio files with player"
echo "  ├── reports/        - Email and website templates"  
echo "  ├── documents/      - Demo documents and research"
echo "  ├── research/       - Data files and analysis results"
echo "  └── index.html      - Enhanced interactive template"