{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
   ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.kernelModules = [ "amdgpu" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.hyprland.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
  };

  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.tailscale.enable = true;
  services.blueman.enable = true;

  users.users.ethan = {
    isNormalUser = true;
    description = "ethan";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nano
    git
    tailscale
    brightnessctl    
    bibata-cursors
    bluez
    blueman
  ]; 
  system.stateVersion = "25.11";
}
