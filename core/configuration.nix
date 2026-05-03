{ pkgs, nix-your-shell, ... }:

{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.overlays = [
    nix-your-shell.overlays.default
    (final: prev: {
      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-job
        nix-fast-build
        colmena
        ;
    })
  ];

  environment = {
    systemPackages = [
      pkgs.vim
      pkgs.nix-your-shell
    ];
  };
}
