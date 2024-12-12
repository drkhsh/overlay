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
│   ├── sops
│   └── ws3
├── app-backup
│   └── proxmox-backup-client
├── app-misc
│   └── spicetify-cli
├── app-text
│   └── urlscan
├── dev-python
│   ├── pynput
│   └── py-sonic
├── games-fps
│   └── assaultcube
├── gui-apps
│   └── swayosd
├── media-sound
│   ├── mopidy-jellyfin
│   ├── mopidy-mpd
│   └── mopidy-subidy
├── profiles
│   └── systemd-hardened
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
- x11-terms/st
- x11-wm/dwm
- x11-misc/dmenu
- x11-misc/slock

# License

CC0 etc blabla
