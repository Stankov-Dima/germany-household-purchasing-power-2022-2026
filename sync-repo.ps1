param(
    [string]$CommitMessage
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

$branch = (git rev-parse --abbrev-ref HEAD).Trim()
if (-not $branch) {
    throw "Unable to detect the current git branch."
}

Write-Host "Repository:" $repoRoot
Write-Host "Branch:" $branch

git status -sb
git pull --rebase origin $branch

git add -A

$hasChanges = git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No staged changes found. Repository is already up to date."
    exit 0
}

if (-not $CommitMessage) {
    $CommitMessage = Read-Host "Commit message"
}

if (-not $CommitMessage) {
    throw "A commit message is required when there are changes to sync."
}

git commit -m $CommitMessage
git push origin $branch

Write-Host "Sync completed successfully."