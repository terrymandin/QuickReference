# Git

## Common Commands

```
git status
git pull
git add .
git add -A //any change in the repo
git commit -m "message"
git commit -a -m "message" //skip staging area
git push
git push --set-upstream origin dev
git diff
git rm
git rm --cached
git remote -v // source of the repo
dotnet new gitignore
git cloning
 - use email and token for login
 - "Compare and Pull Request" to merge dev -> master
 - For token
   - Upper right corner profile picture
   - Settings
   - Developer Settings
   - Generate new token
git clone https://<gitUser>:<token>@<gitURL?.git
git pull upstream main
git remote -v
git remote add upstream https://github.com/<repo>
 ```
type .\.git\config  // shows original repo

# GitHub

## Search a repo

1. Go to: [https://cs.github.com/](https://cs.github.com/)
2. Enter: ```repo:<name> <searchtext>```

# Troubleshooting

## Refusing to allow a Personal Access Token

[Remove credentials from Git](https://stackoverflow.com/questions/15381198/remove-credentials-from-git)
```
git config --global --unset credential.helper
git config --system --unset credential.helper
git config --global credential.helper manager
```
Then delete all Generic Credentials from "Manage Windows Credentials.
