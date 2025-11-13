
# ============================================================================
# DEBIAN (Trixie) BASH FILE
# ============================================================================
# Used for RPi device

# ----------------------------------------------------------------------------
# SOME USEFUL COMMANDS
# ----------------------------------------------------------------------------
# cat /etc/os-release                              # check which OS installed
# ps -p $$                               # know which shell is currently used
alias sp='systemctl poweroff'
alias sr='systemctl reboot'

# ----------------------------------------------------------------------------
# NETWORK
# ----------------------------------------------------------------------------
alias nwr='sudo nmcli device wifi rescan'
alias nwl='nmcli device wifi list'
alias nwc='nmcli device wifi connect'
alias ncm='nmcli connection modify'
alias ncs='nmcli connection show'

alias wcc='iw reg get'                                # get wifi country-code

