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
│   │   └── files
│   └── ws3
├── app-backup
│   └── proxmox-backup-client
│       └── files
├── app-text
│   └── urlscan
├── dev-python
│   ├── pynput
│   └── py-sonic
├── games-fps
│   └── assaultcube
│       └── files
├── gui-apps
│   └── swayosd
│       └── files
├── media-sound
│   ├── mopidy-jellyfin
│   ├── mopidy-mpd
│   └── mopidy-subidy
├── metadata
│   └── md5-cache
│       ├── x11-misc
│       ├── x11-terms
│       └── x11-wm
├── profiles
│   └── systemd-hardened
├── sys-auth
│   └── yubikey-touch-detector
├── x11-misc
│   ├── dmenu
│   │   └── files
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
