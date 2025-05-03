{ config, pkgs, ... }:

{
  home = {
    username = "sholdue";
    homeDirectory = "/home/sholdue";
    stateVersion = "24.11";

    packages = with pkgs; [
      neofetch
      htop
      yazi
      git
      firefox
      telegram-desktop
      kitty
      tealdeer
      trashy 
    ];

    shellAliases = {
      nixup = "nix flake update --flake /home/sholdue/nix";
      nixswitch = "sudo nixos-rebuild switch --flake /home/sholdue/nix#world";
      hms = "home-manager switch --flake /home/sholdue/nix/home#sholdue";
      cleanup = "sudo nix-collect-garbage -d";
      rm = "trash";
      rmdir = "trash";
    };
  };

  imports = [
      ./utils/fish.nix
  ];
  programs.fish.enable = true;
  programs.home-manager.enable = true;
}
