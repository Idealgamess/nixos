{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      home = "sudo nano /etc/nixos/home.nix";
      config = "sudo nano /etc/nixos/configuration.nix";
      svim = "sudo -E nvim";
      nixd = "cd /etc/nixos";
      nerdfetch = "/etc/nixos/modules/nerdfetch";
    };
    bashrcExtra = ''
      /etc/nixos/modules/nerdfetch
    '';
  };
}
