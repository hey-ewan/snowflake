{ pkgs, inputs, system, ... }:
with pkgs; with inputs; [
  wget
  zed-editor
  ntfs3g
  git
  eza
  bat
  neovim
  cloudflare-warp
  wayland-pipewire-idle-inhibit
  gummi
  rustup
  go
  fishMinimal
  localsend
  telegram-desktop
  btop
  httpie
  rquickshare
  spotify
  ghostty
  gh
  fastfetchMinimal
  swww
  libreoffice
  lutris
  gitMinimal
  lazygit
  lazydocker
  xwayland-satellite
  easyeffects
  wl-clipboard
  geoclue2
  cliphist
  hyprlock
  starship
  evolve-core
  gradience
  nodejs_24
  pnpm
  texliveTeTeX
  nasm
  zig
  gcc15
  libclang
  gnumake
  cmake
  rust-bindgen
  openssl
  protobuf
  pkgconf
  docker-compose
  figma-linux
  # figma-agent
  vlc
  rustls-libssl
  zls
  yazi
  stow
  jujutsu
  fishPlugins.wakatime-fish
  fishPlugins.sponge
  fishPlugins.gruvbox
  quickshell.packages.${system}.default
  zen-browser.packages."${system}".default
  bibata-cursors
  gtk-engine-murrine
  gnome-tweaks
  kitty
  kitty-img
  kittysay
  libsForQt5.qt5ct
  qt6ct
  qt6.qtwayland
  kdePackages.qt5compat
  libsForQt5.qt5.qtgraphicaleffects
  qt6Packages.qtstyleplugin-kvantum
  kdePackages.qtbase
  kdePackages.qtdeclarative
  kdePackages.qtmultimedia
  kdePackages.qqc2-desktop-style
  kdePackages.sonnet
  kdePackages.kirigami
  kdePackages.kirigami-addons # Not sure if this is needed
  fuzzel
  fprintd-tod
  python313Full
  python313Packages.pip
  libnotify
  dart-sass
  material-symbols
  (pkgs.ignis.override {
    extraPackages = [
      python313Packages.psutil
      python313Packages.jinja2
      python313Packages.pillow
      python313Packages.materialyoucolor
    ];
  })
  pkgs.ignis
  wayland-pipewire-idle-inhibit
  # sgx-ssl
  # sgx-sdk
  # sgx-psw
  # sgxs-tools
  # fortanix-sgx-tools
]
