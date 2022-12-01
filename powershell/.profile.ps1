oh-my-posh init pwsh --config ~/.prompt.omp.json | Invoke-Expression

function one_dir_up {
    Set-Location ..
}

function goto_home {
    Set-Location 'C:\Users\jjaramillo' 
}

function goto_proj {
    Set-Location 'C:\ADT' 
}

function two_dir_up {
    Set-Location ..
    Set-Location ..
}

function switch_worktree ([String] $worktree) {
   goto_proj
   Set-Location $worktree
}

## Useful Aliases
Set-Alias -Name vim -Value nvim
Set-Alias -Name vcpkg -value C:\Users\jjaramillo\vcpkg\vcpkg.exe
Set-Alias -Name cmake -Value 'C:\Program Files\CMake\bin\cmake.exe'
Set-Alias -Name c -Value clear
Set-Alias -Name home -Value goto_home
Set-Alias -Name proj -Value goto_proj
Set-Alias -Name gd -Value switch_worktree
Set-Alias -Name .. -Value one_dir_up 
Set-Alias -Name ... -Value two_dir_up 

## Module Imports
Import-Module posh-git
Import-Module PSReadLine
Import-Module C:\ADT\master\NugetPackModule.psm1
Import-Module C:\ADT\master\documentation\ServiceDocs\TeamDocs\HowToGuides\ComponentGovernance\Helpers\ArtifactModules.psm1

Set-PSReadLineOption -PredictionSource History
