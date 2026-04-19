{
  description = "Python development environment";

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
            name = "python";

            packages = with pkgs; [
              python3
              uv
            ];

            env = {
              LD_LIBRARY_PATH =
                with pkgs;
                lib.makeLibraryPath [
                  stdenv.cc.cc
                  stdenv.cc.libc
                ];
              UV_NO_SYNC = "1";
              UV_PYTHON = pkgs.python3.interpreter;
              UV_PYTHON_DOWNLOADS = "never";
            };

            shellHook = ''
              # create venv if it doesn't exist
              if [ ! -d .venv ]; then
                echo "Creating venv..."
                uv venv
              fi

              # activate the venv
              source .venv/bin/activate

              # sync venv
              uv sync
            '';
          };
        };
    };
}
