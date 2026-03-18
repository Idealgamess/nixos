{ config, pkgs, ... }: {
  home.username = "ZacharyS";
  home.homeDirectory = "/home/ZacharyS";
  home.stateVersion = "25.11";

  imports = [
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/bash.nix
    ./modules/wofi.nix
    ./modules/git.nix
  ];

  xdg.configFile = {
    "waybar/config".source = ./waybar/config;
    "waybar/style.css".source = ./waybar/style.css;
    "waybar/scripts".source = ./waybar/scripts;
    "waybar/assets".source = ./waybar/assets;
    "waybar/themes".source = ./waybar/themes;

    "swaync/config.json".source = ./swaync/config.json;
    "swaync/style.css".source = ./swaync/style.css;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    neovim
    cmake
    gcc
    gnumake
    hyprshot
    waybar
    kdePackages.dolphin
    swww
    discord
    obs-studio
    easyeffects
    fastfetch
    nerdfetch
    swaynotificationcenter
    nerd-fonts.hurmit
    nerd-fonts.code-new-roman
    steam
    r2modman
  ];
}
