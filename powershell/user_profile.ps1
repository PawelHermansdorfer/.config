# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
function prompt
{
    "$Env:username $((''+$PWD).replace($HOME, '~')) $ "
}

Start-Process neofetch  -NoNewWindow


# Alias
Set-Alias -Name vim -Value nvim
Set-Alias -Name nvide -Value neovide
Set-Alias -Name ll -Value ls
Set-Alias -Name open -Value explorer
Set-Alias -Name grep -Value findstr


# Remove to bin
Set-Alias -Name rm -Value Remove-ItemSafely


# Cool icons
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
Set-PSReadLineKeyHandler -Chord 'Ctrl+Delete' -Function DeleteWord


# Fuzzy finder
Import-Module -Name PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'


# Initialize mscv build tools
$found_vcvarsall = $True
if(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2011
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2012
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2013
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio 13.0\VC\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2014
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2015
}
# 2017+
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2017
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2017
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2019
}
elseif(Test-Path -Path "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2019
}
# 2022 +

elseif(Test-Path -Path "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2022
}
elseif(Test-Path -Path "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvarsall.bat" -PathType Leaf)
{
    $vs_year = 2022
}
# Not found
else
{
    Write-Output "Cannot find vcvarsall.bat.\nYou must have installed Visual Studio"
    $found_vcvarsall = $False
}

$pointerSizeInBytes = (4, 8)[[Environment]::Is64BitOperatingSystem]
if($found_vcvarsall -eq $True)
{
    if($pointerSizeInBytes -eq 8)
    {
        Import-VisualStudioVars $vs_year amd64
    }
    else
    {
        Import-VisualStudioVars $vs_year amd64_x86
    }
}


# Touch
if(test-path alias:touch)
{
    Remove-Item 'Alias:\touch' -Force
}
Function touch {
    [cmdletbinding()]
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }
    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}

# Which
function which ($command) {
    if($command -eq $null) {
        throw "No command supplied"
    }
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Mklink
function mklink ($link, $target) {
    if($link -eq $null) {
        throw "Link file not supplied"
    }
    if($target -eq $null) {
        throw "Target file not supplied"
    }
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

# CheckFile
function CheckFile($file_path)
{
     Test-Path -Path $file_path -PathType Leaf
}
