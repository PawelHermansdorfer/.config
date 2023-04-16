# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# oh-my-posh
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+j' -Function NextHistory
Set-PSReadLineKeyHandler -Chord 'Ctrl+k' -Function PreviousHistory
Set-PSReadLineKeyHandler -Chord 'Ctrl+RightArrow' -Function NextWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+LeftArrow' -Function BackwardWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+Backspace' -Function BackwardDeleteWord

# Fzf
# Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias -Name nvide -Value neovide
Set-Alias -Name ll -Value ls
Set-Alias -Name open -Value explorer
Set-Alias -Name touch -Value ni
Set-Alias -Name rm -Value Remove-ItemSafely

# Initialize mscv build tools
# Import-VisualStudioVars 2022 amd64


# Which
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
