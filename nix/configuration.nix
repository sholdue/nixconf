{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./graphics.nix
  ];

  ############################################
  # BLUETOOTH
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
  ############################################
  # BOOTLOADER
  boot.kernelModules = [ "amdgpu" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  ############################################
  # HOSTNAME
  networking.hostName = "world";
  ############################################
  # NETWORKING
  networking.networkmanager.enable = true;
  ############################################
  # NIX SETTINGS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;
  ############################################
  # TIME & LOCALE
  time.timeZone = "Europe/Zagreb";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hr_HR.UTF-8";
    LC_IDENTIFICATION = "hr_HR.UTF-8";
    LC_MEASUREMENT = "hr_HR.UTF-8";
    LC_MONETARY = "hr_HR.UTF-8";
    LC_NAME = "hr_HR.UTF-8";
    LC_NUMERIC = "hr_HR.UTF-8";
    LC_PAPER = "hr_HR.UTF-8";
    LC_TELEPHONE = "hr_HR.UTF-8";
    LC_TIME = "hr_HR.UTF-8";
  };
  ############################################
  # GARBAGE COLLECTION
  nix.gc = {
    automatic = true;
    dates = "weekly";
    persistent = true;
    options = "--delete-older-than 90d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "monthly" ];
  };
  ############################################
  # X11 & DESKTOP
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.displayManager.lightdm.enable = true;

  services.xserver.xkb = {
    layout = "us,ru";
    variant = ",";
    options = "grp:alt_shift_toggle";
  };
  ############################################
  # AUDIO
  hardware.pulseaudio.enable = true;

  systemd.services.pipewire.enable = false;
  systemd.services.pipewire-pulse.enable = false;
  systemd.services.pipewire-media-session.enable = false;
  services.pipewire.enable = false;
  ############################################
  # GRAPHICS/SWITCHING
  services.supergfxd.enable = true;
  systemd.services.supergfxd.path = [ pkgs.pciutils ];
  ############################################
  # USERS & GROUPS
  users.groups.nixos.members = [ "sholdue" ];
  users.users.sholdue = {
    description = "sholdue";
    isNormalUser = true;
    uid = 1000;
    initialHashedPassword =
      "$y$j9T$qCJSqgFkwD/HqWq08gpT70$P3Ykjl1L.1vfVHHWSqqkG2Efne1o/EzGfJatybfaVR6";
    useDefaultShell = false;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [
      home-manager
    ];
  };
  ############################################
  # SERVICES
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
  ############################################
  # SYSTEM PACKAGES
  environment.systemPackages = with pkgs; [
    trashy
    p7zip
    brightnessctl
    home-manager
  ];
  ############################################
  # SYSTEM VERSION
  system.stateVersion = "24.11";
}
