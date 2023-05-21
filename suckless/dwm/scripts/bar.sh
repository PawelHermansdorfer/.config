#!/bin/zsh

# ^c$var^ = fg color
# ^b$var^ = bg color

fg_normal=#abb3bf
fg_dark=#585767

bg_light=#323141
bg_normal=#1E1D2D
bg_dark=#140e1a

purple_dark=#651c3b
purple_light=#82245B

pink_dark=#B14C79
pink_light=#955F8D

extra=#CD3864

blue_dark=#1E607B
blue_light=#347e9e

green_dark=#7eca9c
green_light=#7eFa9c

red=#D72E4C

ram() {
    # MemTotal:        x kB
    # MemFree:         x kB
    # MemAvailable:    x kB
    # Buffers:         x kB
    # Cached:          x kB
    #        1           3           4         5          1
    # 100 * ((MemTotal - MemFree) - (Buffers + Cached)) / MemTotal);
    ram_val="$(awk 'NR==1{total=$2; total2=$2} NR==2{free=$2} NR==4{buffers=$2} NR==5{cached=$2}END {print 100*(total - free - buffers - cached) / total}' /proc/meminfo)"
    printf "^c$extra^^b$bg_normal^ RAM %.1f%% " $ram_val
}

cpu() {
    cpu_val=$(top -bn1 | grep "Cpu(s)" | \
            sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
            awk '{print 100 - $1"%"}')

    printf "^c$purple_light^^b$bg_normal^ CPU $cpu_val% "
}

# TODO(Aa_Pawelek): Check if this works
pacman_updates() {
    updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch

    if [ $updates != 0 ]; then
        printf "^c$extra^^b$bg_normal^   $updates updates "
    else
        printf "^c$extra^^b$bg_normal^   Fully Updated "
    fi
}

btc() {
    price="$(curl -s 'https://api.binance.com/api/v1/ticker/price?symbol=BTCUSDT' | cut -d: -f3 | sed 's/"//g; s/}//g')"

    printf "^c$fg_normal^^b$purple_dark^   " $price
    printf "^c$fg_normal^^b$bg_light^ %.0f$ " $price
}

battery() {
    capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
    is_charging="$(cat /sys/class/power_supply/BAT0/status)"

    #|[100,97)|[97,90)|[90,80)|[80,70)|[70,60)|[60,50)|[50,40)|[40,30)|[30,20)|[20,10)|[10,0]|
    #|    󰁹   |   󰂂   |   󰂁   |   󰂀   |   󰁿   |   󰁾   |   󰁽   |   󰁼   |   󰁻   |   󰁺   |   󱃍  |
    #|    󰂅   |   󰂋   |   󰂊   |   󰢞   |   󰂉   |   󰢝   |   󰂈   |   󰂇   |   󰂆   |   󰢜   |   󰢟  |
    if [[ $is_charging == *"Discharging"* ]]; then
        if [ "$capacity" -gt "97" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰁹 "
        elif [ "$capacity" -gt "90" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰂂 "
        elif [ "$capacity" -gt "80" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰂁 "
        elif [ "$capacity" -gt "70" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰂀 "
        elif [ "$capacity" -gt "60" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰁿 "
        elif [ "$capacity" -gt "50" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰁾 "
        elif [ "$capacity" -gt "40" ]; then 
            printf "^c$fg_normal^^b$bg_normal^ 󰁽 "
        elif [ "$capacity" -gt "30" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰁼 "
        elif [ "$capacity" -gt "20" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰁻 "
        elif [ "$capacity" -gt "10" ]; then
            printf "^c$fg_normal^^b$bg_normal^ 󰁻 "
        else
            printf "^c$red^^b$bg_normal^ 󱃍 "
        fi

        if [ "$capacity" -gt "10" ]; then
            printf "^c$fg_normal^^b$bg_normal^$capacity%% "
        else
            printf "^c$red^^b$bg_normal^$capacity%% "
        fi
    else
        if [ "$capacity" -gt "97" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰂅  "
        elif [ "$capacity" -gt "90" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰂋  "
        elif [ "$capacity" -gt "80" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰂊  "
        elif [ "$capacity" -gt "70" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰢞  "
        elif [ "$capacity" -gt "60" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰂉  "
        elif [ "$capacity" -gt "50" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰢝  "
        elif [ "$capacity" -gt "40" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰂈  "
        elif [ "$capacity" -gt "30" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰂈  "
        elif [ "$capacity" -gt "20" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰂆  "
        elif [ "$capacity" -gt "10" ]; then
            printf "^c$green_light^^b$bg_normal^ 󰢜  "
        else
            printf "^c$green_light^^b$bg_normal^ 󰢟  "
        fi
        printf "^c$green_light^^b$bg_normal^$capacity%% "
    fi
}

clock() {
	printf "^c$fg_normal^^b$purple_dark^ 󱑆  "
	printf "^c$fg_normal^^b$purple_light^ $(date '+%H:%M') "
}


interval=0
while true; do
    [ $interval = 0 ] || [ $(($interval % 10)) = 0 ] && btc_price=$(btc)
    [ $interval = 0 ] || [ $(($interval % 1800)) = 0 ] && updates=$(pacman_updates)
    interval=$((interval + 1))

    xsetroot -name "     $(cpu)$(ram)$btc_price$updates$(battery)$(clock)" && sleep 1
done
