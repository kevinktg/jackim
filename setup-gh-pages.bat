@echo off
REM Change these variables to match your details
set REPO_NAME=infographic-site
set REPO_DESC="Interactive infographic site with audio narration and GH Pages"
set GH_USER=kevinktg

echo Creating GitHub repository and setting up GitHub Pages...
echo.

REM Initialize git repository
echo Initializing git repository...
git init
if %errorlevel% neq 0 (
    echo Error: Failed to initialize git repository
    pause
    exit /b 1
)

REM Add all files to staging
echo Adding files to git...
git add .
if %errorlevel% neq 0 (
    echo Error: Failed to add files to git
    pause
    exit /b 1
)

REM Create initial commit
echo Creating initial commit...
git commit -m "Initial commit"
if %errorlevel% neq 0 (
    echo Error: Failed to create initial commit
    pause
    exit /b 1
)

REM Create GitHub repository
echo Creating GitHub repository: %REPO_NAME%...
gh repo create %REPO_NAME% --description %REPO_DESC% --public --source=. --remote=origin --push
if %errorlevel% neq 0 (
    echo Error: Failed to create GitHub repository
    pause
    exit /b 1
)

REM Enable GitHub Pages
echo Enabling GitHub Pages...
gh api repos/%GH_USER%/%REPO_NAME%/pages -X POST -f source[branch]=master -f source[path]=/
if %errorlevel% neq 0 (
    echo Warning: Failed to enable GitHub Pages via API. You may need to enable it manually in the repository settings.
)

echo.
echo ✓ Repository created successfully!
echo ✓ Files pushed to GitHub
echo ✓ GitHub Pages setup initiated
echo.
echo Repository URL: https://github.com/%GH_USER%/%REPO_NAME%
echo GitHub Pages URL: https://%GH_USER%.github.io/%REPO_NAME%
echo.
echo Note: It may take a few minutes for GitHub Pages to become available.

pause