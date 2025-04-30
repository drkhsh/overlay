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
│   ├── bitwarden-menu
│   ├── loki
│   ├── sops-bin
│   └── ws3
├── app-backup
│   └── proxmox-backup-client
├── app-misc
│   ├── hellwal
│   └── spicetify-cli
├── app-text
│   └── urlscan
├── dev-python
│   ├── cheetah3
│   ├── pynput
│   └── py-sonic
├── games-fps
│   └── assaultcube
├── gui-apps
│   ├── swayosd
│   ├── waybar
│   └── widle
├── media-sound
│   ├── mopidy-jellyfin
│   ├── mopidy-mpd
│   └── mopidy-subidy
├── net-libs
│   └── libtorrrent
├── net-misc
│   └── sacc
├── net-nntp
│   └── sabnzbd
├── net-p2p
│   ├── flood-bin
│   └── rtorrent
├── sys-auth
│   └── yubikey-touch-detector
├── x11-misc
│   ├── dmenu
│   ├── slock
│   └── slstatus
├── x11-terms
│   └── st
└── x11-wm
    └── dwm
```

Patches/Changes
---------------
my fork:
- gui-apps/waybar
- x11-terms/st
- x11-wm/dwm
- x11-misc/dmenu
- x11-misc/slock

# License

CC0 etc blabla
