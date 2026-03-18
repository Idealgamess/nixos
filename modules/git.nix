{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Idealgamess";
      user.email = "Zacharysharo@gmail.com";
      credential.helper = "store";
      safe.directory = "/etc/nixos"; 
   };
  };
}
