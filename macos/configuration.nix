{
  imports = [
    ../core/configuration.nix
    ./services
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  users = {
    users.bhuvannatesh = {
      name = "bhuvannatesh";
      home = "/Users/bhuvannatesh";
    };
  };

  system.primaryUser = "bhuvannatesh";
  system.stateVersion = 6;
}
