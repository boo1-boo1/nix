{
  nix-homebrew,
  homebrew-core,
  homebrew-cask,
  a-bar,
  home-manager,
  lazyvim,
  ...
}:
{
  imports = [
    ./configuration.nix
    ./homebrew.nix
    nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = "bhuvannatesh";

        taps = {
          "homebrew/homebrew-core" = homebrew-core;
          "homebrew/homebrew-cask" = homebrew-cask;
          "Jean-Tinland/homebrew-a-bar" = a-bar;
        };

        mutableTaps = false;
      };
    }
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "bak";
        users.bhuvannatesh = {
          home = {
            username = "bhuvannatesh";
            homeDirectory = "/Users/bhuvannatesh";
          };
          imports = [
            lazyvim.homeManagerModules.default
            ../home
          ];
        };
      };
    }
  ];
}
