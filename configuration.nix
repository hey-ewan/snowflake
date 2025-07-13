{ config, pkgs, inputs, system, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  documentation.enable = false;
  documentation.nixos.enable = false;

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Lagos";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NG";
    LC_IDENTIFICATION = "en_NG";
    LC_MEASUREMENT = "en_NG";
    LC_MONETARY = "en_NG";
    LC_NAME = "en_NG";
    LC_NUMERIC = "en_NG";
    LC_PAPER = "en_NG";
    LC_TELEPHONE = "en_NG";
    LC_TIME = "en_NG";
  };

  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
    nerd-fonts.space-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts.inconsolata
  ];

  users.users.ewan = {
    isNormalUser = true;
    description = "ewan";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "ewan";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  systemd.packages = [ pkgs.cloudflare-warp ];
  systemd.targets.multi-user.wants = [ "warp-svc.service" ];
  services.cloudflare-warp.enable = true;
  systemd.user.services.warp-taskbar.wantedBy = [ "graphical.target" ];

  programs.firefox.enable = true;
  programs.niri.enable = true;
  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Environment variables for Qt/QML applications
  environment.variables = {
    QML2_IMPORT_PATH = with pkgs; lib.concatStringsSep ":" [
      "${libsForQt5.qt5.qtgraphicaleffects}/lib/qt-5/qml"
      "${kdePackages.qt5compat}/lib/qt-6/qml"
      "${kdePackages.qtbase}/lib/qt-6/qml"
      "${kdePackages.qtdeclarative}/lib/qt-6/qml"
    ];
  };

  environment.systemPackages = with pkgs; import ./packages.nix { inherit pkgs; inherit inputs; inherit system; };

  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
