
# Windows
### Font
- [Liberation Mono Nerd Font]

### Mouse and keyboard
- Normal cursor: cross_l.cur
- Link cursor: cross_rl.cur
- Mouse sensivity: 6/11
- Key repeate delay: the shortest
- Key repeate rate: the fastest

### Desktop theme
 - All desktop icons hiden
 - Taskbar alignment: center
 - Automatically hide taskbar

### Apps
 - Windows Terminal
 - Powershell
 - Git
 - Neovim
 - Neofetch
 - Google chrome

### Setup
 - Install Winget(App Installer) from Microsoft Store
 - Install Scoop
```console
> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
> irm get.scoop.sh | iex
```
 - Clone Repository
```console
> cd $env:USERPROFILE
> git clone https://github.com/PawelHermansdorfer/.config --recurse-submodules
```
 - Install Modules
```console
> Install-Module -Name Terminal-Icons -Repository PSGallery -Force
> Install-Module -Name Recycle -Force
> Install-Module -Name z -Force
> Install-Module -Name PSReadLine -Force
> Install-Module -Name PSFzf -Force
> Install-Module -Name Pscx -Force
> scoop install neofetch
> scoop install fzf
```
 - Link configs to repository
```console
> echo ". $env:USERPROFILE\.config\powershell\user_profile.ps1" >> $PROFILE.CurrentUserCurrentHost
> mklink $env:USERPROFILE\Appdata\local\nvim $env:USERPROFILE\.config\nvim
> mklink $env:USERPROFILE\Appdata\local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $env:USERPROFILE\.config\windows_terminal\settings.json
```
Note: If you cannot change settings.json you may need to run this command with windows terminal closed

# Arch Linux
### Font
 - [TTF Liberation Mono Nerd]

[Liberation Mono Nerd Font]: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
[TTF Liberation Mono Nerd]: https://archlinux.org/packages/community/any/ttf-liberation-mono-nerd/
