{ config, pkgs, ... }:
{
  home.username = "ewan";
  home.homeDirectory = "/home/ewan";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "hey-ewan";
    userEmail = "ewan@s3n.xyz";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.home-manager.enable = true;

  home.file = {
    ".config/niri/config.kdl".source = ./sources/config.kdl;
    ".config/yazi/yazi.toml".source = ./sources/yazi.toml;
    ".config/starship.toml".source = ./sources/starship.toml;
    ".config/zed".source = ./sources/zed;
    ".config/zed".recursive = true;
    ".config/ghostty".source = ./sources/ghostty;
    ".config/ghostty".recursive = true;
    ".config/fastfetch".source = ./sources/fastfetch;
    ".config/fastfetch".recursive = true;
    ".config/quickshell".source = ./sources/quickshell;
    ".config/quickshell".recursive = true;
    ".config/qt5ct".source = ./sources/qt5ct;
    ".config/qt5ct".recursive = true;
    ".config/qt6ct".source = ./sources/qt6ct;
    ".config/qt6ct".recursive = true;
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
  };

  home.sessionVariables = {
    DISABLE_QT5_COMPAT = "0";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
  };
}
