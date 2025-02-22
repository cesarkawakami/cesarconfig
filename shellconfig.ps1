Set-PSReadLineOption -EditMode Emacs

function Invoke-GitBranchless {
    git-branchless wrap -- @args
}
Set-Alias -Name g -Value Invoke-GitBranchless
Set-Alias -Name git -Value Invoke-GitBranchless
