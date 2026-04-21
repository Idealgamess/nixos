{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minesddm = {
      url = "github:Davi-S/sddm-theme-minesddm/development";
      flake = false;
    };
  };
  outputs = { nixpkgs, home-manager, minesddm, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ZacharyS = import ./home.nix;
        }
        ({ pkgs, ... }: {
          services.displayManager.sddm = {
            enable = true;
            theme = "minesddm";
          };
          environment.systemPackages = [
            (pkgs.runCommand "sddm-theme-minesddm" {} ''
              mkdir -p $out/share/sddm/themes
              cp -r ${minesddm}/minesddm $out/share/sddm/themes/minesddm
            '')
          ];
        })
      ];
    };
  };
}
