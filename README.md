
# Windows
![Desktop Screenshot](/images/windows.png "Hello")

### Wallpaper and font
- [Wallpaper][Windows wallpaper]
- [More wallpapers][Windows more wallpapers]
- [Font][Windows Font]

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
 - PowerToys
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

- Install Modules
```console
> Install-Module -Name Terminal-Icons -Repository PSGallery -Force
> Install-Module -Name Recycle -Force
> Install-Module -Name z -Force
> Install-Module -Name PSReadLine -Force
> Install-Module -Name PSFzf -Force
> Install-Module -Name Pscx -Force
> scoop bucket add extras
> scoop install neofetch fzf neovim powertoys
```

 - Clone Repository
```console
> cd $env:USERPROFILE
> git clone https://github.com/PawelHermansdorfer/.config --recurse-submodules
```

 - Link configs to repository
```console
> echo ". $env:USERPROFILE\.config\powershell\user_profile.ps1" >> $PROFILE.CurrentUserCurrentHost
> mklink $env:USERPROFILE\Appdata\local\nvim $env:USERPROFILE\.config\nvim
> mklink $env:USERPROFILE\Appdata\local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $env:USERPROFILE\.config\windows_terminal\settings.json
```
Note: If you cannot change settings.json you may need to run this command with windows terminal closed.

 - Restore PowerToys settings
Go to (General > "Backup & restore" > Location) and select path to folder .config/powertoys. Next click button "Restore".


# Arch Linux
### Wallpaper and font
- [Wallpaper][Linux wallpaper]
- [Font][Linux font]

[Windows font]: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
[Windows wallpaper]: https://wallpapercave.com/w/wp11596702
[Windows more wallpapers]: https://wallpapercave.com/darkwood-game-wallpapers

[Linux wallpaper]: https://www.deviantart.com/grivetart/art/iPad-Pro-Procreate-test-607332295
[Linux font]: https://archlinux.org/packages/community/any/ttf-liberation-mono-nerd/
