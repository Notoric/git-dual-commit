# Get the current directory name
$current_dir = Split-Path -Path (Get-Location) -Leaf

# Create README.md file
New-Item -Path "$current_dir\README.md" -ItemType File

# Initialize git repository
git init
git remote add all "https://github.com/Notoric/$current_dir.git"
git remote set-url --add --push all "https://github.com/Notoric/$current_dir.git"
git remote set-url --add --push all "https://gitea.notoricloud.net/Notoric/$current_dir.git"
git add .
git branch -M main
git commit -m "initial commit"
git push origin main
git push gitea main
