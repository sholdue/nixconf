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
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
  	experimental-features = nix-command flakes
  	warn-dirty = false
  '';
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
  #services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
 
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };
	
  ############################################
  # SOME PROGRAMS (BECAUSE HOME-MANAGER DOESNT SUPPORT INSTALL IT LOCALY) shit...
  programs = {
	steam = {
  		enable = true;
  		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  		localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts
      noto-fonts-emoji
      font-awesome
      source-han-sans
      open-sans
      source-han-sans-japanese
      source-han-serif-japanese
      jetbrains-mono
      siji
    ];
    enableDefaultPackages = true;
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Open Sans" "Source Han Sans" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
  ############################################
  # AUDIO
  # hardware.pulseaudio.enable = true;

  # systemd.services.pipewire.enable = false;
  # systemd.services.pipewire-pulse.enable = false;
  # systemd.services.pipewire-media-session.enable = false;
  # services.pipewire.enable = false;
  security.rtkit.enable = true;
	services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	alsa.support32Bit = true;
  	pulse.enable = true;
  	# If you want to use JACK applications, uncomment this
  	#jack.enable = true;
  };
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
      rofi-wayland
    ];
  };
  ############################################
  # SERVICES
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
  services.power-profiles-daemon.enable = true;
  ############################################
  # SYSTEM PACKAGES
  environment.systemPackages = with pkgs; [
    trashy
    p7zip
    brightnessctl
    home-manager
    blueman
    tlp
    power-profiles-daemon
    qt5.qtwayland
    qt6.qtwayland
    lxqt.lxqt-policykit
  ];
  ############################################
  # SYSTEM VERSION
  system.stateVersion = "24.11";
}
