# Arch Linux
![Desktop Screenshot](/images/linux.png "Linux screenshot")

### Wallpaper and font
- [Wallpaper][Linux wallpaper]
- [Font][Linux font]

### Apps
 - yay (AUR) 
 - zsh (shell)
 - dwm/[chadwm][Chadwm] (window manager)
 - lightdm (login manager)
 - [web-greeter][web_greeter] && [lightdm-neon][lightdm_theme]
 - neofetch
 - [picom (pijulius fork)][picom]
 - rofi
 - pipewire (audio control)
 - xfce4 for settings

### Setup
 - Install yay
```console
$ git clone https://aur.archlinux.org/yay-git
$ cd yay 
$ sudo makepkg
```

 - Install apps and fonts
```shell
$ pacman -S nvim rofi lightdm neofetch google-chrome ttf-iosevka-nerd ttf-jetbrains-mono-nerd ttf-liberation
```

 - Clone Repository
```shell
$ cd ~
$ git clone https://github.com/PawelHermansdorfer/.config --recurse-submodules
```

 - Build dwm
```shell
$ cd ~/.config/suckless/dwm
$ sudo make clean install
```

 - Setup dwm profile
```
# Create dwm profile in  /usr/share/xsessions/dwm.desktop  
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=Dynamic window manager
Exec=/home/PawelHermansdorfer/.config/suckless/dwm/scripts/run.sh
Icon=dwm
Type=Application
```

- Setup lightdm
```shell
$ yay -S web-greeter
$ yay -S lightdm-theme-neon-git
```
```
# Enable web-greeter in /etc/lightdm/lightdm.conf
greeter-session = web-greeter
```
```
# Enable theme in /etc/lightdm/web-greeter.yml
greeter:
    theme: neon
```

 - Link zshrc
```console
$ ln ~/.config/.zshrc ~/.zshrc
```
 - Install picom
```console
$ yay -S picom-pijulius-git
```

### Other awesome configs
 - [Unixsea][Unixsea]
 - [Chadwm][Chadwm]
 - [Ft-Labs][Ft-Labs]
 - [Adi1090x][Adi1090x]


# Windows
![Desktop Screenshot](/images/windows.png "Windows screenshot")

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


# Grub
![Desktop Screenshot](/images/grub.png "Windows screenshot")

### Theme
 - [Poly dark][grub_theme]
 - [More fun themes][mode_grub_themes]

### Setup
- Install theme
```console
$ wget -O - https://github.com/shvchk/poly-dark/raw/master/install.sh | bash
```

- Disable boot messages
add "fsck.mode=skip quiet splash loglevel=3" to kernel boot parameters in /etc/defalut/grub

 - Booting messages
```
# Comment these lines /boot/grub/grub.cfg
echo 'Loading Linux Linux...'
echo 'Loading initial ram disk ...'
```

[Windows font]: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
[Windows wallpaper]: https://wallpapercave.com/w/wp11596702
[Windows more wallpapers]: https://wallpapercave.com/darkwood-game-wallpapers

[Linux wallpaper]: https://www.deviantart.com/grivetart/art/iPad-Pro-Procreate-test-607332295
[Linux font]: https://archlinux.org/packages/community/any/ttf-liberation-mono-nerd/
[web_greeter]: https://github.com/JezerM/web-greeter
[lightdm_theme]: https://github.com/hertg/lightdm-neon
[picom]: https://github.com/pijulius/picom

[Unixsea]: https://github.com/unixsea/dotfiles/tree/master/.config
[Chadwm]: https://github.com/siduck/chadwm
[Ft-Labs]: https://github.com/FT-Labs/dotfiles
[adi1090x]: https://github.com/adi1090x/widgets

[grub_theme]: https://github.com/shvchk/poly-dark
[mode_grub_themes]: https://github.com/RomjanHossain/Grub-Themes
