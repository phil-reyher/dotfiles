#!/usr/bin/sh

interval=""
aur_helper=""
xbps_num=""
aur_num=""
pkg_num=""

# Error message in STDERR
_err() {
    printf -- '%s\n' "[$(date +'%Y-%m-%d %H:%M:%S')]: $*" >&2
}

# Display tags before yambar fetch the updates number
printf -- '%s\n' "xbps|int|0"
# printf -- '%s\n' "aur|int|0"
# printf -- '%s\n' "pkg|int|0"
printf -- '%s\n' ""

while true; do
    # Change interval
    # NUMBER[SUFFIXE]
    # Possible suffix:
    #  "s" seconds / "m" minutes / "h" hours / "d" days
    interval="1m"

    # Change your aur manager
    # aur_helper="paru"

    # Get number of packages to update
    xbps_num=$(xbps-install -nuM | wc -l)

    # if ! command -v "${aur_helper}" >/dev/null 2>&1; then
    #     _err "aur helper not found, change it in the script"
    #     exit 1
    # else
    #     aur_num=$("$aur_helper" -Qmu | wc -l)
    # fi

    # pkg_num=$((xbps_num + aur_num))

    printf -- '%s\n' "xbps|int|${xbps_num}"
    #printf -- '%s\n' "aur|int|${aur_num}"
    # printf -- '%s\n' "pkg|int|${pkg_num}"
    printf -- '%s\n' ""

    sleep "${interval}"

done

unset interval aur_helper xbps_num aur_num pkg_num
unset -f _err
