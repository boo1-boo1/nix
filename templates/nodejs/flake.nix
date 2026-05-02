{
  description = "NodeJS development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            name = "nodejs";

            packages = with pkgs; [
              nodejs
              yarn-berry
            ];

            shellHook = ''
              # check and install dependencies
              if [ -f package.json ]; then
                echo "Installing dependencies..."
                yarn install
              fi
            '';
          };
        };
    };
}
