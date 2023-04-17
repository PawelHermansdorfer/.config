# Windows
## Dependencies
 - Windows Terminal
 - Powershell
 - Neovim

## Installation
```console
$ cd cd $env:USERPROFILE
$ git clone https://github.com/PawelHermansdorfer/.config --recurse-submodules
$ Install-Module -Name Terminal-Icons -Repository PSGallery -Force
$ Install-Module -Name Recycle -Force
$ Install-Module -Name z -Force
$ Install-Module -Name PSReadLine -Force
$ Install-Module -Name PSFzf -Force
$ Install-Module -Name Pscx -Force
$ echo ". $env:USERPROFILE\.config\powershell\user_profile.ps1" >> $PROFILE.CurrentUserCurrentHost
$ mklink $env:USERPROFILE\Appdata\local\nvim $env:USERPROFILE\.config\nvim
$ mklink $env:USERPROFILE\Appdata\local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $env:USERPROFILE\.config\windows_terminal\settings.json
```
Note: If you cannot change settings.json you may need to run this command with windows terminal closed

# Font
- [Liberation Mono Nerd Font]

[Liberation Mono Nerd Font]: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
