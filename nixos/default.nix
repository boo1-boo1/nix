{
  home-manager,
  lazyvim,
  ...
}:
{
  imports = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "bak";
        users.bhuvan = {
          home = {
            username = "bhuvan";
            homeDirectory = "/home/bhuvan";
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
