{
  pkgs,
  zen-browser,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../core/configuration.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.utf-8";

  users.users.bhuvan = {
    isNormalUser = true;
    description = "Bhuvan Natesh";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [
      pkgs.kdePackages.kate
      zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "dvp";
    };
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  virtualisation.vmware.guest.enable = true;

  system.stateVersion = "25.11";
}
