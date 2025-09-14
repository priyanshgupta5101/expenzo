# Go to project root
Set-Location "D:\Expenzo"

# Initialize Git if not already done
if (-not (Test-Path ".git")) {
    git init
    Write-Host "✅ Git initialized."
}

# Create .gitignore if it doesn't exist
$gitignoreContent = @"
node_modules
.next
.env.local
.env
dist
coverage
"@
if (-not (Test-Path ".gitignore")) {
    $gitignoreContent | Out-File ".gitignore" -Encoding utf8
    Write-Host "✅ .gitignore created."
}

# Add all files
git add .

# Commit changes
git commit -m "Initial commit: Expenzo - Expense Management App"

# Ask for GitHub repo URL
$repoUrl = Read-Host "Enter your GitHub repository URL (e.g., https://github.com/USERNAME/expenzo.git)"

# Add remote origin (replace if exists)
if (git remote | Select-String "origin") {
    git remote remove origin
}
git remote add origin $repoUrl

# Push to GitHub main branch
git branch -M main
git push -u origin main

Write-Host "🚀 Project pushed to GitHub successfully!"
