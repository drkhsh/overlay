```
▓█████▄  ██▀███   ██ ▄█▀ ██░ ██   ██████  ██░ ██
▒██▀ ██▌▓██ ▒ ██▒ ██▄█▒ ▓██░ ██▒▒██    ▒ ▓██░ ██▒
░██   █▌▓██ ░▄█ ▒▓███▄░ ▒██▀▀██░░ ▓██▄   ▒██▀▀██░
░▓█▄   ▌▒██▀▀█▄  ▓██ █▄ ░▓█ ░██   ▒   ██▒░▓█ ░██
░▒████▓ ░██▓ ▒██▒▒██▒ █▄░▓█▒░██▓▒██████▒▒░▓█▒░██▓
 ▒▒▓  ▒ ░ ▒▓ ░▒▓░▒ ▒▒ ▓▒ ▒ ░░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒
  ░ ▒  ▒   ░▒ ░ ▒░░ ░▒ ▒░ ▒ ░▒░ ░░ ░▒  ░ ░ ▒ ░▒░ ░
   ░ ░  ░   ░░   ░ ░ ░░ ░  ░  ░░ ░░  ░  ░   ░  ░░ ░
      ░       ░     ░  ░    ░  ░  ░      ░   ░  ░  ░
       ░
                                   GENTOO OVERLAY
```

drkhsh-overlay
==============
drkhsh's Gentoo overlay.
You are on your own if you use my overlay. Packages are stable for amd64. All
other architectures are testing if upstream supports it.
Everything should be reasonable commented and understandable.

Included ebuilds
----------------
```
├── app-admin
│   └── bitwarden-menu
├── app-backup
│   └── proxmox-backup-client
├── dev-python
│   ├── py-pynput
│   └── py-sonic
├── games-fps
│   └── assaultcube
├── media-sound
│   ├── mopidy-jellyfin
│   ├── mopidy-mpd
│   └── mopidy-subidy
├── sys-kernel
│   └── gentoo-sources-6.6.6
├─── x11-terms
│   └── st
├─── x11-wm
│   └── dwm
└─── x11-misc
    ├── slstatus
    ├── slock
    └── dmenu
```

Patches/Changes
---------------
my fork:
- x11-terms/st
- x11-wm/dwm
- x11-misc/dmenu
- x11-misc/slock

fixes:
- app-misc/cmatrix

# License

CC0 etc blabla
